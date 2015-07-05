class TancamentsVerticalsController < ApplicationController
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  layout 'edifici'

  # GET /tancaments_verticals
  # GET /tancaments_verticals.json
  def index
    @tancaments_verticals = TancamentsVertical.all
  end

  # GET /tancaments_verticals/1
  # GET /tancaments_verticals/1.json
  def show
  end

  # GET /tancaments_verticals/new
  def new
    @tancaments_vertical = TancamentsVertical.new
  end

  # GET /tancaments_verticals/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'tancaments_verticals'
  end

  # POST /tancaments_verticals
  # POST /tancaments_verticals.json
  def create
    @tancaments_vertical = TancamentsVertical.new(tancaments_vertical_params)

    respond_to do |format|
      if @tancaments_vertical.save
        format.html { redirect_to @tancaments_vertical, notice: 'Tancaments vertical was successfully created.' }
        format.json { render :show, status: :created, location: @tancaments_vertical }
      else
        format.html { render :new }
        format.json { render json: @tancaments_vertical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tancaments_verticals/1
  # PATCH/PUT /tancaments_verticals/1.json
  def update
    respond_to do |format|
      if @tancaments_vertical.update(tancaments_vertical_params)
        format.html { redirect_to edit_edifici_tancaments_vertical_path }
        format.json { render :show, status: :ok, location: @tancaments_vertical }
      else
        format.html { render :edit }
        format.json { render json: @tancaments_vertical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tancaments_verticals/1
  # DELETE /tancaments_verticals/1.json
  def destroy
    @tancaments_vertical.destroy
    respond_to do |format|
      format.html { redirect_to tancaments_verticals_url, notice: 'Tancaments vertical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_sistemes
      @edifici = Edifici.find(params[:edifici_id])
      @fonamentacio = Fonamentacio.find(@edifici.fonamentacio.id)
      @estructura = Estructura.find(@edifici.estructura.id)
      @tancaments_vertical = TancamentsVertical.find(@edifici.tancaments_vertical.id)
      @coberta = Coberta.find(@edifici.coberta.id)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tancaments_vertical_params
      params.require(:tancaments_vertical).permit(:edifici_id, :acabat_vist_paredat, :acabat_vist_carreus, :acabat_vist_fabrica_mao, :acabat_vist_fabrica_bloc_ceramic, :acabat_vist_bloc_formigo, :acabat_vist_panell_formigo, :acabat_vist_panell_metalic_sandwich, :acabat_revestit_arrebossat_pintat, :acabat_revestit_estucat, :acabat_revestit_morter_monocapa, :acabat_revestit_aplacat_ceramic, :acabat_revestit_aplacat_pedra, :acabat_revestit_xapa_metalica, :cambra_aire_facana, :fusteria_fusta, :fusteria_acer, :fusteria_alumini, :fusteria_pvc, :vidre_simple, :vidre_doble, :vidre_triple, :vidre_baix_emissiu, :vidre_control_solar)
    end
end
