class AiguesController < ApplicationController
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /aigues
  # GET /aigues.json
  def index
    @aigues = Aigua.all
  end

  # GET /aigues/1
  # GET /aigues/1.json
  def show
  end

  # GET /aigues/new
  def new
    @aigua = Aigua.new
  end

  # GET /aigues/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'aigua'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'aigua')
  end

  # POST /aigues
  # POST /aigues.json
  def create
    @aigua = Aigua.new(aigua_params)

    respond_to do |format|
      if @aigua.save
        format.html { redirect_to @aigua, notice: 'Aigua was successfully created.' }
        format.json { render :show, status: :created, location: @aigua }
      else
        format.html { render :new }
        format.json { render json: @aigua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aigues/1
  # PATCH/PUT /aigues/1.json
  def update
    respond_to do |format|
      if @aigua.update(aigua_params)
        format.html { redirect_to edit_edifici_aigua_path }
        format.json { render :show, status: :ok, location: @aigua }
      else
        format.html { render :edit }
        format.json { render json: @aigua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aigues/1
  # DELETE /aigues/1.json
  def destroy
    @aigua.destroy
    respond_to do |format|
      format.html { redirect_to aigues_url, notice: 'Aigua was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aigua
      @aigua = Aigua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aigua_params
      params.require(:aigua).permit(:edifici_id, :connexio_directa, :connexio_aforament, :captacio_propia, :comptador_unic, :comptadors_individuals_habitatge, :comptadors_individuals_centralitzats, :grup_pressio, :muntants_plom, :muntants_ferro, :muntants_coure, :muntants_plastic)
    end
end
