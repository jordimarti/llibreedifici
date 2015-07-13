class VentilacionsController < ApplicationController
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /ventilacions
  # GET /ventilacions.json
  def index
    @ventilacions = Ventilacio.all
  end

  # GET /ventilacions/1
  # GET /ventilacions/1.json
  def show
  end

  # GET /ventilacions/new
  def new
    @ventilacio = Ventilacio.new
  end

  # GET /ventilacions/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'ventilacio'
  end

  # POST /ventilacions
  # POST /ventilacions.json
  def create
    @ventilacio = Ventilacio.new(ventilacio_params)

    respond_to do |format|
      if @ventilacio.save
        format.html { redirect_to @ventilacio, notice: 'Ventilacio was successfully created.' }
        format.json { render :show, status: :created, location: @ventilacio }
      else
        format.html { render :new }
        format.json { render json: @ventilacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventilacions/1
  # PATCH/PUT /ventilacions/1.json
  def update
    respond_to do |format|
      if @ventilacio.update(ventilacio_params)
        format.html { redirect_to edit_edifici_ventilacio_path  }
        format.json { render :show, status: :ok, location: @ventilacio }
      else
        format.html { render :edit }
        format.json { render json: @ventilacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventilacions/1
  # DELETE /ventilacions/1.json
  def destroy
    @ventilacio.destroy
    respond_to do |format|
      format.html { redirect_to ventilacions_url, notice: 'Ventilacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ventilacio
      @ventilacio = Ventilacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ventilacio_params
      params.require(:ventilacio).permit(:edifici_id, :habitatge_natural_conductes, :habitatge_natural_obertures, :habitatge_mecanica_conductes, :habitatge_mecanica_obertures, :habitatge_mecanica_control, :traster_natural_conductes, :traster_natural_obertures, :traster_mecanica_conductes, :traster_mecanica_obertures, :traster_mecanica_control, :magatzem_natural_conductes, :magatzem_natural_obertures, :magatzem_mecanica_conductes, :magatzem_mecanica_obertures, :magatzem_mecanica_control, :garatge_natural_conductes, :garatge_natural_obertures, :garatge_mecanica_conductes, :garatge_mecanica_obertures, :garatge_mecanica_control)
    end
end
