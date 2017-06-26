class PagamentsController < ApplicationController
  # Posem skip pq vindrà d'un servidor extern i no hi haurà authenticity token
  skip_before_filter :verify_authenticity_token
  before_action :set_pagament, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici, only: [:index, :show, :new, :edit, :create, :destroy, :validar_dades]

  # GET /pagaments
  # GET /pagaments.json
  def index
    @pagaments = Pagament.where(pagat: true)
  end

  # GET /pagaments/1
  # GET /pagaments/1.json
  def show
  end

  # GET /pagaments/new
  def new
    @pagament = Pagament.new
  end

  # GET /pagaments/1/edit
  def edit
  end

  def validar_dades
    @usuari_factura = UsuariFactura.new
    @empresa_factura = EmpresaFactura.new
    @nif_usuari = current_user.nif

  end

  # POST /pagaments
  # POST /pagaments.json
  def crear_pagament
    @pagament = Pagament.new()
    @pagament.user_id = current_user.id
    @pagament.edifici_id = params[:edifici_id]
    @pagament.numorder = numorder(params[:edifici_id])
    @pagament.import = "42,96"
    @pagament.pagat = false
    titular = current_user.name
    url_pagament = 'http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx?titular=' + titular + '&importe=' + @pagament.import + '&numorder=' + @pagament.numorder.to_s + '&descripcion=llibreedifici&urlresponse=http://llibreedifici.apabcn.cat/pagaments/update_pagament'
    #http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx?titular=Titular&importe=42,96&numorden=110000000101&descripcion=llibreedifici&urlresponse=http://llibreedifici.apabcn.cat/pagaments/update_pagament
    respond_to do |format|
      if @pagament.save
        format.html { redirect_to url_pagament }
        format.json { render :show, status: :created, location: @pagament }
      else
        format.html { render :new }
        format.json { render json: @pagament.errors, status: :unprocessable_entity }
      end
    end
  end

  def numorder(edifici_id)
    codi_factura = '058'
    projecte = edifici_id
    numero_projecte = sprintf '%07d', projecte
    intent = Pagament.where(edifici_id: edifici_id).count + 1
    numero_intent = sprintf '%02d', intent
    final = codi_factura + numero_projecte + numero_intent
    return final
  end

  # PATCH/PUT /pagaments/1
  # PATCH/PUT /pagaments/1.json
  #def update
  #  pagament = Pagament.where(:numorder => params[:numorder])
  #  respond_to do |format|
  #    if pagament.update(pagament_params)
  #      format.html { redirect_to @pagament, notice: 'Pagament was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @pagament }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @pagament.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update_pagament                  
    pagament = Pagament.where(:numorder => params[:numorden]).last
    if pagament != nil
      if pagament.numorder != nil
        pagament.resultado = params[:resultado]
        pagament.autorizacion = params[:autorizacion]
        if pagament.resultado == '0000'
          pagament.pagat = true
        else
          pagament.pagat = false
        end
      else
        pagament.pagat = false
      end
      pagament.save
      # Una vegada s'ha fet el pagament i s'ha actualitzat la base de dades s'envia la factura
      if pagament.pagat == true
        # Comprovem si ja s'ha enviat una factura
        if pagament.factura_enviada != true
          # Especifiquem que s'ha enviat una factura per evitar duplicats de factures si s'executa de nou update_pagament
          pagament.factura_enviada = true
          pagament.save
          # Enviem la factura
          @resultat_enviament = envia_factura(pagament) 
        end
      end
      @info_pagament = pagament
    end
  end

  def envia_factura(pagament)
    # Comprovem si l'última factura d'aquest edifici és d'usuari o d'empresa
    factura_usuari = UsuariFactura.where(edifici_id: pagament.edifici_id).last
    factura_empresa = EmpresaFactura.where(edifici_id: pagament.edifici_id).last
    client = Savon.client(wsdl: "http://isis.apabcn.cat/LibroEdificio/wsfacturasSap.asmx?wsdl")
    if factura_usuari != nil && factura_empresa != nil
      if factura_usuari.updated_at > factura_empresa.updated_at
        factura = factura_usuari
      else
        factura = factura_empresa
      end
    end
    if factura_usuari != nil && factura_empresa == nil
      factura = factura_usuari
    end
    if factura_usuari == nil && factura_empresa != nil
      factura = factura_empresa
    end  

    if factura == factura_usuari
      puts "Seleccionat: factura usuari"
      resposta = client.call(:create_fact_usuario, message: { 'ParamUsuario' => { nombre: factura.nom, nif: factura.nif, poblacion: '19', provincia: '08', codpostal: factura.codi_postal, direccion: factura.adreca, pais: 'ES', email: factura.email, numcliente: factura.num_client, escolegiado: factura.colegiat }, 'ParamOtrosDatos' => { referenciapago: pagament.numorder }})
      dades = resposta.to_hash
      resultat = dades[:create_fact_usuario_response][:create_fact_usuario_result]
    else 
      puts "Seleccionat: factura empresa"
      puts "NombreJuridico: #{factura.nom_juridic}"
      puts "CIF: #{factura.nif}"
      puts "email: #{factura.email}"
      resposta = client.call(:create_factura_empresa, message: { 'ParamEmpresa' => { 'NombreJuridico' => factura.nom_juridic, 'CIF' => factura.nif, poblacion: '19', provincia: '08', codpostal: factura.codi_postal, direccion: factura.adreca, email: factura.email, pais: 'ES', tipocliente: '' }, 'ParamOtrosDatos' => { referenciapago: pagament.numorder }})
      dades = resposta.to_hash
      resultat = dades[:create_factura_empresa_response][:create_factura_empresa_result]
    end

    if resultat == "0"
      #redirect_to edificis_path
      return true
    else 
      #redirect_to error_factura_path
      puts "Resultat: #{resultat}"
      return false
    end
  end

  def error_factura

  end

  # DELETE /pagaments/1
  # DELETE /pagaments/1.json
  def destroy
    @pagament.destroy
    respond_to do |format|
      format.html { redirect_to pagaments_url, notice: 'Pagament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagament
      @pagament = Pagament.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagament_params
      params.require(:pagament).permit(:user_id, :edifici_id, :numorder, :import, :resultado, :autorizacion, :pagat, :factura_enviada)
    end
end
