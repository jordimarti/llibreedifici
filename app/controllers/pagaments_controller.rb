class PagamentsController < ApplicationController
  before_action :set_pagament, only: [:show, :edit, :update, :destroy]

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
  def create
    @pagament = Pagament.new(pagament_params)
    @pagament.user_id = current_user.id
    @pagament.numorder = numorder()
    @pagament.import = "42,96"
    titular = current_user.name
    url_pagament = 'http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx?titular=' + titular + '&importe=' + @pagament.import + '&numorder=' + @pagament.numorder + '&descripcion=llibreedifici'

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
      return 110000000001
    end   
  end

  # PATCH/PUT /pagaments/1
  # PATCH/PUT /pagaments/1.json
  def update
    respond_to do |format|
      if @pagament.update(pagament_params)
        format.html { redirect_to @pagament, notice: 'Pagament was successfully updated.' }
        format.json { render :show, status: :ok, location: @pagament }
      else
        format.html { render :edit }
        format.json { render json: @pagament.errors, status: :unprocessable_entity }
      end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagament_params
      params.require(:pagament).permit(:user_id, :edifici_id, :numorder, :import, :codi_retorn, :codi_autoritzacio)
    end
end
