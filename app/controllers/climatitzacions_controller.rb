class ClimatitzacionsController < ApplicationController
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /climatitzacions
  # GET /climatitzacions.json
  def index
    @climatitzacions = Climatitzacio.all
  end

  # GET /climatitzacions/1
  # GET /climatitzacions/1.json
  def show
  end

  # GET /climatitzacions/new
  def new
    @climatitzacio = Climatitzacio.new
  end

  # GET /climatitzacions/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'climatitzacio'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'climatitzacio')
  end

  # POST /climatitzacions
  # POST /climatitzacions.json
  def create
    @climatitzacio = Climatitzacio.new(climatitzacio_params)

    respond_to do |format|
      if @climatitzacio.save
        format.html { redirect_to @climatitzacio, notice: 'Climatitzacio was successfully created.' }
        format.json { render :show, status: :created, location: @climatitzacio }
      else
        format.html { render :new }
        format.json { render json: @climatitzacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climatitzacions/1
  # PATCH/PUT /climatitzacions/1.json
  def update
    respond_to do |format|
      if @climatitzacio.update(climatitzacio_params)
        format.html { redirect_to edit_edifici_climatitzacio_path }
        format.json { render :show, status: :ok, location: @climatitzacio }
      else
        format.html { render :edit }
        format.json { render json: @climatitzacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climatitzacions/1
  # DELETE /climatitzacions/1.json
  def destroy
    @climatitzacio.destroy
    respond_to do |format|
      format.html { redirect_to climatitzacions_url, notice: 'Climatitzacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climatitzacio
      @climatitzacio = Climatitzacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climatitzacio_params
      params.require(:climatitzacio).permit(:edifici_id, :escalfador_pn_menor_24, :escalfador_pn_24_70, :escalfador_pn_major_70, :caldera_gas_pn_menor_70, :caldera_gas_pn_major_70, :caldera_biomassa, :caldera_solar_termica, :altres_pn_menor_70, :altres_pn_major_70, :clima_pn_menor_12_autonoms, :clima_pn_menor_12_torres, :clima_pn_menor_12_recuperador, :clima_pn_12_70_autonoms, :clima_pn_12_70_torres, :clima_pn_12_70_recuperador, :clima_pn_major_70_autonoms, :clima_pn_major_70_torres, :clima_pn_major_70_recuperador)
    end
end
