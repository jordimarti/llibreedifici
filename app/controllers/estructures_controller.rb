class EstructuresController < ApplicationController
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /estructures
  # GET /estructures.json
  def index
    @estructures = Estructura.all
  end

  # GET /estructures/1
  # GET /estructures/1.json
  def show
  end

  # GET /estructures/new
  def new
    @estructura = Estructura.new
  end

  # GET /estructures/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'estructura'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'estructura')
  end

  # POST /estructures
  # POST /estructures.json
  def create
    @estructura = Estructura.new(estructura_params)

    respond_to do |format|
      if @estructura.save
        format.html { redirect_to @estructura, notice: 'Estructura was successfully created.' }
        format.json { render :show, status: :created, location: @estructura }
      else
        format.html { render :new }
        format.json { render json: @estructura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estructures/1
  # PATCH/PUT /estructures/1.json
  def update
    respond_to do |format|
      if @estructura.update(estructura_params)
        format.html { redirect_to edit_edifici_estructura_path }
        format.json { render :show, status: :ok, location: @estructura }
      else
        format.html { render :edit }
        format.json { render json: @estructura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estructures/1
  # DELETE /estructures/1.json
  def destroy
    @estructura.destroy
    respond_to do |format|
      format.html { redirect_to estructures_url, notice: 'Estructura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def estructura_params
      params.require(:estructura).permit(:edifici_id, :parets_pedra, :parets_formigo_armat, :parets_tova, :parets_tapia, :parets_fabrica_mao, :parets_bloc_ceramic, :parets_bloc_formigo, :parets_entramat_fusta, :pilars_mao, :pilars_ferro_colat, :pilars_acer, :pilars_formigo_armat, :bigues_fusta, :bigues_metaliques, :bigues_formigo_armat, :forjat_fusta, :forjat_metalic, :forjat_formigo_armat, :forjat_ceramica_armada, :entrebigat_taulell, :entrebigat_revolto_ceramic, :entrebigat_revolto_formigo, :forjat_reticular, :llosa_formigo, :forjat_sanitari, :solera, :forjat_horitzontal_coberta_capa_pendent, :forjat_horitzontal_coberta_envanets, :forjat_inclinat_coberta_formigo, :encavallada_bigues_formigo, :encavallada_bigues_metall, :encavallada_bigues_fusta, :coberta_taulell_ceramic, :coberta_taulell_fusta, :coberta_sandwich, :escala_fusta, :escala_metall, :escala_ceramica, :escala_llosa_armada)
    end
end
