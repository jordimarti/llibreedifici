class ParticionsController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /particions
  # GET /particions.json
  def index
    @particions = Particio.all
  end

  # GET /particions/1
  # GET /particions/1.json
  def show
  end

  # GET /particions/new
  def new
    @particio = Particio.new
  end

  # GET /particions/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.particio.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'particions'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'particions')
  end

  # POST /particions
  # POST /particions.json
  def create
    @particio = Particio.new(particio_params)

    respond_to do |format|
      if @particio.save
        format.html { redirect_to @particio, notice: 'Particio was successfully created.' }
        format.json { render :show, status: :created, location: @particio }
      else
        format.html { render :new }
        format.json { render json: @particio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /particions/1
  # PATCH/PUT /particions/1.json
  def update
    respond_to do |format|
      if @particio.update(particio_params)
        format.html { redirect_to edit_edifici_particio_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @particio }
      else
        format.html { render :edit }
        format.json { render json: @particio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /particions/1
  # DELETE /particions/1.json
  def destroy
    @particio.destroy
    respond_to do |format|
      format.html { redirect_to particions_url, notice: 'Particio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_particio
      @particio = Particio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def particio_params
      params.require(:particio).permit(:edifici_id, :envans_ceramica, :envans_cartro_guix, :envans_bloc_formigo, :envans_paves, :envans_fusta, :envans_plaques_alveolades, :celras_fibres_vegetals, :celras_fibres_minerals, :celras_plaques_guix, :celras_metalic, :celras_fusta, :aillament_sota_sostre, :aillament_sobre_sostre, :aillament_plaques, :aillament_mantes, :aillament_amorf, :aillament_fibra_vidre, :aillament_polietile_reticulat, :aillament_llana_roca, :aillament_escuma_fenolica, :aillament_escuma_poliureta, :aillament_polietile_expandit, :aillament_fibres_textils, :aillament_argila_expandida, :aillament_escuma_melamina, :aillament_poliestire_extrudit, :aillament_celulosa, :aillament_perlita_expandida, :aillament_suro_aglomerat, :revestiment_vertical_enguixat, :revestiment_vertical_arrebossat, :revestiment_horitzontal_enguixat, :revestiment_horitzontal_arrebossat, :acabat_pintat, :acabat_aplacat_ceramica, :acabat_empaperat, :acabat_taulell_fusta, :acabat_sintetic, :acabat_textil, :acabat_estuc, :acabat_aplacat_pedra, :acabat_fusta, :acabat_suro, :paviment_formigo, :paviment_pedra_natural, :paviment_terratzo, :paviment_mosaic_hidraulic, :paviment_suro, :paviment_ceramica_natural, :paviment_ceramica_esmaltada, :paviment_gres_natural, :paviment_goma, :paviment_parquet_encolat, :paviment_parquet_flotant, :paviment_parquet_llates, :paviment_pvc, :paviment_moqueta, :paviment_linoleum, :porta_bastiment_fusta, :porta_bastiment_metalic, :porta_fulla_massissa_fusta, :porta_fulla_aplacat_fusta, :porta_fulla_vidre, :porta_fulla_alumini, :porta_fulla_ferro, :porta_acabat_pintat, :porta_acabat_lacat, :porta_acabat_envernissat, :porta_ferratge_llauto, :porta_ferratge_acer_llautonat, :porta_ferratge_acer_niquelat, :porta_ferratge_acer_inoxidable, :porta_ferratge_alumini, :barana_ferro_forjat, :barana_perfils_acer, :barana_perfils_alumini, :barana_fusta, :barana_pvc, :barana_vidre_laminat, :barana_metacrilat)
    end
end
