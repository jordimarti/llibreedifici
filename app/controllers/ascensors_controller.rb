class AscensorsController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /ascensors
  # GET /ascensors.json
  def index
    @ascensors = Ascensor.all
  end

  # GET /ascensors/1
  # GET /ascensors/1.json
  def show
  end

  # GET /ascensors/new
  def new
    @ascensor = Ascensor.new
  end

  # GET /ascensors/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.ascensor.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'ascensors'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'ascensors')
  end

  # POST /ascensors
  # POST /ascensors.json
  def create
    @ascensor = Ascensor.new(ascensor_params)

    respond_to do |format|
      if @ascensor.save
        format.html { redirect_to @ascensor, notice: 'Ascensor was successfully created.' }
        format.json { render :show, status: :created, location: @ascensor }
      else
        format.html { render :new }
        format.json { render json: @ascensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ascensors/1
  # PATCH/PUT /ascensors/1.json
  def update
    respond_to do |format|
      if @ascensor.update(ascensor_params)
        format.html { redirect_to edit_edifici_ascensor_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @ascensor }
      else
        format.html { render :edit }
        format.json { render json: @ascensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ascensors/1
  # DELETE /ascensors/1.json
  def destroy
    @ascensor.destroy
    respond_to do |format|
      format.html { redirect_to ascensors_url, notice: 'Ascensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ascensor
      @ascensor = Ascensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ascensor_params
      params.require(:ascensor).permit(:edifici_id, :habitatge_unifamiliar, :edifici_comunitari, :mes_20_plantes, :altres)
    end
end
