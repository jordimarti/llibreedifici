class SanejamentsController < ApplicationController
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /sanejaments
  # GET /sanejaments.json
  def index
    @sanejaments = Sanejament.all
  end

  # GET /sanejaments/1
  # GET /sanejaments/1.json
  def show
  end

  # GET /sanejaments/new
  def new
    @sanejament = Sanejament.new
  end

  # GET /sanejaments/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'sanejament'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'sanejament')
  end

  # POST /sanejaments
  # POST /sanejaments.json
  def create
    @sanejament = Sanejament.new(sanejament_params)

    respond_to do |format|
      if @sanejament.save
        format.html { redirect_to @sanejament, notice: 'Sanejament was successfully created.' }
        format.json { render :show, status: :created, location: @sanejament }
      else
        format.html { render :new }
        format.json { render json: @sanejament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sanejaments/1
  # PATCH/PUT /sanejaments/1.json
  def update
    respond_to do |format|
      if @sanejament.update(sanejament_params)
        format.html { redirect_to edit_edifici_sanejament_path }
        format.json { render :show, status: :ok, location: @sanejament }
      else
        format.html { render :edit }
        format.json { render json: @sanejament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sanejaments/1
  # DELETE /sanejaments/1.json
  def destroy
    @sanejament.destroy
    respond_to do |format|
      format.html { redirect_to sanejaments_url, notice: 'Sanejament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sanejament
      @sanejament = Sanejament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sanejament_params
      params.require(:sanejament).permit(:edifici_id, :no_sistema_evacuacio, :si_sistema_evacuacio, :fosa_septica, :bomba_elevacio, :separador_greixos, :baixants_vistos, :baixants_encastats, :baixants_ceramics, :baixants_pvc, :baixants_fibrociment, :baixants_coure, :baixants_alumini, :baixants_polipropile, :baixants_zinc, :colectors_vistos, :colectors_soterrats, :colectors_formigo, :colectors_ceramic, :colectors_fibrociment, :colectors_pvc)
    end
end
