class EmpresaFacturesController < ApplicationController
  before_action :set_empresa_factura, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici

  # GET /empresa_factures
  # GET /empresa_factures.json
  def index
    @empresa_factures = EmpresaFactura.all
  end

  # GET /empresa_factures/1
  # GET /empresa_factures/1.json
  def show
  end

  # GET /empresa_factures/new
  def new
    @empresa_factura = EmpresaFactura.new
  end

  # GET /empresa_factures/1/edit
  def edit
  end

  # POST /empresa_factures
  # POST /empresa_factures.json
  def create
    @empresa_factura = EmpresaFactura.new(empresa_factura_params)
    # Guardem el NIF introduït
    nou_nif = @empresa_factura.nif
    # Comprovem si existeix l'empresa a la base de dades
    client = Savon.client(wsdl: "http://isis.apabcn.cat/LibroEdificio/wsfacturasSap.asmx?wsdl")
    resposta = client.call(:get_empresa, message: { cif: @empresa_factura.nif })
    dades = resposta.to_hash
    @empresa_factura.nom_juridic = dades[:get_empresa_response][:param_empresa][:nombre_juridico]
    @empresa_factura.nif = dades[:get_empresa_response][:param_empresa][:cif]
    @empresa_factura.poblacio = dades[:get_empresa_response][:param_empresa][:poblacion]
    @empresa_factura.provincia = dades[:get_empresa_response][:param_empresa][:provincia]
    @empresa_factura.codi_postal = dades[:get_empresa_response][:param_empresa][:codpostal]
    @empresa_factura.adreca = dades[:get_empresa_response][:param_empresa][:direccion]
    @empresa_factura.pais = dades[:get_empresa_response][:param_empresa][:pais]
    @empresa_factura.email = dades[:get_empresa_response][:param_empresa][:email]
    @empresa_factura.tipus_client = dades[:get_empresa_response][:param_empresa][:tipocliente]
    @empresa_factura.save
    if @empresa_factura.nif
      redirect_to edifici_empresa_factura_path(id: @empresa_factura.id)
    else
      @empresa_factura.nif = nou_nif
      @empresa_factura.save
      redirect_to edit_edifici_empresa_factura_path(id: @empresa_factura.id)
    end
  end

  # PATCH/PUT /empresa_factures/1
  # PATCH/PUT /empresa_factures/1.json
  def update
    respond_to do |format|
      if @empresa_factura.update(empresa_factura_params)
        format.html { redirect_to crear_pagament_path }
        format.json { render :show, status: :ok, location: @empresa_factura }
      else
        format.html { render :edit }
        format.json { render json: @empresa_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresa_factures/1
  # DELETE /empresa_factures/1.json
  def destroy
    @empresa_factura.destroy
    respond_to do |format|
      format.html { redirect_to empresa_factures_url, notice: 'Empresa factura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa_factura
      @empresa_factura = EmpresaFactura.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_factura_params
      params.require(:empresa_factura).permit(:user_id, :edifici_id, :nom_juridic, :adreca, :poblacio, :provincia, :pais, :codi_postal, :email, :tipus_client, :nif)
    end
end
