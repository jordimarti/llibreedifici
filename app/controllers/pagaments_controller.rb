class PagamentsController < ApplicationController
  # Posem skip pq vindrà d'un servidor extern i no hi haurà authenticity token
  skip_before_filter :verify_authenticity_token
  before_action :set_pagament, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici, only: [:index, :show, :new, :edit, :create, :destroy]

  # GET /pagaments
  # GET /pagaments.json
  def index
    @pagaments = Pagament.all
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

  # POST /pagaments
  # POST /pagaments.json
  def crear_pagament
    @pagament = Pagament.new()
    @pagament.user_id = current_user.id
    @pagament.edifici_id = params[:edifici_id]
    @pagament.numorder = numorder()
    @pagament.import = "42,96"
    @pagament.pagat = false
    titular = current_user.name
    url_pagament = 'http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx?titular=Titular&importe=' + @pagament.import + '&numorden=' + @pagament.numorder.to_s + '&descripcion=llibreedifici&urlresponse=http://llibreedifici.apabcn.cat/pagaments/update_pagament'
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

  def numorder
    ultim_pagament = Pagament.last
    if ultim_pagament
      numorder = ultim_pagament.numorder + 1
      return numorder
    else
      return 110000000104
    end   
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
        pagament.pagat = true
      else
        pagament.pagat = false
      end
      pagament.save
      @info_pagament = pagament
    end
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
      params.require(:pagament).permit(:user_id, :edifici_id, :numorder, :import, :resultado, :autorizacion, :pagat)
    end
end
