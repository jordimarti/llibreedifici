class UsuariFacturesController < ApplicationController
  before_action :set_usuari_factura, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici

  # GET /usuari_factures
  # GET /usuari_factures.json
  def index
    @usuari_factures = UsuariFactura.all
  end

  # GET /usuari_factures/1
  # GET /usuari_factures/1.json
  def show
  end

  # GET /usuari_factures/new
  def new
    @usuari_factura = UsuariFactura.new
  end

  # GET /usuari_factures/1/edit
  def edit

  end

  #def create_old
  #  @usuari_factura = UsuariFactura.new(usuari_factura_params)
  #  #De moment anul·lo la validació al crear les dades de factura. Això és perquè primer es va a la pàgina de validació de dades, on l'usuari només ha de posar el NIF. Si tinc una validació d'altres camps com email no puc passar a la següent pàgina. Quan es faci l'update, en la confirmació de dades, sí que hi haurà validació de tots els camps, inclòs el NIF.
  #  if @usuari_factura.save(validate: false)
  #
  #  else
  #    redirect_to validar_dades_path(@edifici.id), flash: { error: @usuari_factura.errors.messages }
  #    return
  #  end
  #  # Guardem el NIF introduït per si no és el de l'usuari
  #  nou_nif = @usuari_factura.nif
  #  # Comprovem si existeix l'usuari a la base de dades
  #  #client = Savon.client(wsdl: "http://isis.apabcn.cat/LibroEdificio/wsfacturasSap.asmx?wsdl")
  #  client = Savon.client(wsdl: "https://partial-caateebcn-partial.cs82.force.com/bookpurchase/services/Soap/class/BookPurchaseService")
  #  resposta = client.call(:get_usuario, message: { nif: @usuari_factura.nif })
  #  dades = resposta.to_hash
  #  @usuari_factura.nom = dades[:get_usuario_response][:param_usuario][:nombre]
  #  @usuari_factura.nif = dades[:get_usuario_response][:param_usuario][:nif]
  #  @usuari_factura.poblacio = dades[:get_usuario_response][:param_usuario][:poblacion]
  #  @usuari_factura.provincia = dades[:get_usuario_response][:param_usuario][:provincia]
  #  @usuari_factura.codi_postal = dades[:get_usuario_response][:param_usuario][:codpostal]
  #  @usuari_factura.adreca = dades[:get_usuario_response][:param_usuario][:direccion]
  #  #@usuari_factura.email = dades[:get_usuario_response][:param_usuario][:email]
  #  @usuari_factura.email = current_user.email
  #  @usuari_factura.num_client = dades[:get_usuario_response][:param_usuario][:numcliente]
  #  @usuari_factura.colegiat = dades[:get_usuario_response][:param_usuario][:escolegiado]
  #  @usuari_factura.save(validate: false)
  #  if @usuari_factura.nif
  #    redirect_to edifici_usuari_factura_path(id: @usuari_factura.id)
  #  else
  #    @usuari_factura.nif = nou_nif
  #    @usuari_factura.save(validate: false)
  #    redirect_to edit_edifici_usuari_factura_path(id: @usuari_factura.id)
  #  end
  #end

  def create
    @usuari_factura = UsuariFactura.new(usuari_factura_params)
    #De moment anul·lo la validació al crear les dades de factura. Això és perquè primer es va a la pàgina de validació de dades, on l'usuari només ha de posar el NIF. Si tinc una validació d'altres camps com email no puc passar a la següent pàgina. Quan es faci l'update, en la confirmació de dades, sí que hi haurà validació de tots els camps, inclòs el NIF.
    if @usuari_factura.save(validate: false)

    else
      redirect_to validar_dades_path(@edifici.id), flash: { error: @usuari_factura.errors.messages }
      return
    end
    # Guardem el NIF introduït per si no és el de l'usuari
    nou_nif = @usuari_factura.nif
    # Comprovem si existeix l'usuari a la base de dades
    endpoint = 'https://apabcn.secure.force.com/bookpurchase/services/apexrest/books?document=' + nou_nif
    resposta = HTTParty.get(endpoint)
    dades = resposta.to_hash
    @usuari_factura.nom = dades['nombre']
    @usuari_factura.nif = dades['nif']
    @usuari_factura.poblacio = dades['poblacion']
    @usuari_factura.provincia = dades['provincia']
    @usuari_factura.codi_postal = dades['codpostal']
    @usuari_factura.adreca = dades['direccion']
    #@usuari_factura.email = dades['email']
    @usuari_factura.email = current_user.email
    @usuari_factura.num_client = dades['numcliente']
    @usuari_factura.colegiat = dades['escolegiado']
    @usuari_factura.save(validate: false)
    if @usuari_factura.nif
      redirect_to edifici_usuari_factura_path(id: @usuari_factura.id)
    else
      @usuari_factura.nif = nou_nif
      @usuari_factura.save(validate: false)
      redirect_to edit_edifici_usuari_factura_path(id: @usuari_factura.id)
    end
  end

  # PATCH/PUT /usuari_factures/1
  # PATCH/PUT /usuari_factures/1.json
  def update
    respond_to do |format|
      if @usuari_factura.update(usuari_factura_params)
        # Creem l'usuari per al SAP
        #crear_usuari_sap(@usuari_factura)
        format.html { redirect_to crear_pagament_path }
        format.json { render :show, status: :ok, location: @usuari_factura }
      else
        format.html { render :edit }
        format.json { render json: @usuari_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  #def crear_usuari_sap(@usuari_factura)
  #  
  #end

  # DELETE /usuari_factures/1
  # DELETE /usuari_factures/1.json
  def destroy
    @usuari_factura.destroy
    respond_to do |format|
      format.html { redirect_to usuari_factures_url, notice: 'Usuari factura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuari_factura
      @usuari_factura = UsuariFactura.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuari_factura_params
      params.require(:usuari_factura).permit(:user_id, :edifici_id, :nom, :adreca, :poblacio, :provincia, :pais, :codi_postal, :email, :num_client, :colegiat, :nif)
    end
end
