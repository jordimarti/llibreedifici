class TancamentsVerticalsController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
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
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.tancaments_vertical.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'tancaments_verticals'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'tancaments')
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
        format.html { redirect_to edit_edifici_tancaments_vertical_path, notice: t('.guardat_ok') }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def tancaments_vertical_params
      params.require(:tancaments_vertical).permit(:edifici_id, :paret_pedra, :paret_mao_massis, :paret_mao_perforat, :paret_bloc_morter, :paret_bloc_formigo_lleuger, :plafons_formigo_massis, :plafons_formigo_alveolat, :plafons_formigo_aillant, :mur_cortina, :acabat_obra_vista, :acabat_revestiment_arrebossat, :acabat_pintura_plastica, :acabat_pintura_silicat, :acabat_revestiment_resines, :acabat_pintura_cals, :acabat_esgrafiat, :acabat_estuc_cals, :acabat_morter_monocapa, :acabat_aplacat_pedra, :acabat_aplacat_enrajolat, :acabat_aplacat_plafons, :acabat_aplacat_fixacio_morter, :acabat_aplacat_fixacio_acer_galvanitzat, :acabat_aplacat_fixacio_acer_inoxidable, :acabat_aplacat_fixacio_alumini, :cambra_aire_facana, :aillament_termic, :parets_mitgeres_enva_ceramica, :parets_mitgeres_xapa_acer, :parets_mitgeres_arrebossat, :parets_mitgeres_pintura_silicat, :parets_mitgeres_plaques_fibrociment, :parets_mitgeres_pintura_plastica, :parets_mitgeres_pintura_cals, :balcons_llosana_pedra, :balcons_solera_ancorada, :balcons_formigo_armat, :balcons_acer, :ampits_xapa_metalica, :ampits_ceramica, :ampits_prefabricat_formigo, :llindes_formigo_armat, :llindes_ceramics, :llindes_acer, :baranes_pedra_natural, :baranes_pedra_artificial, :baranes_obra, :baranes_ferro_forjat, :baranes_perfils_acer, :baranes_fusta, :baranes_malla_metalica, :baranes_vidre_laminat, :baranes_perfils_alumini, :reixes_ferro_forjat, :reixes_alumini, :persianes_enrotllables_pvc, :persianes_enrotllables_alumini, :persianes_enrotllables_fusta, :persianes_llibret_pvc, :persianes_llibret_alumini, :persianes_llibret_acer, :persianes_llibret_fusta, :gelosies_prefabricat_formigo, :gelosies_lameles_metaliques, :gelosies_lameles_plastic, :gelosies_ceramica, :fusteria_fusta, :fusteria_acer, :fusteria_alumini, :fusteria_pvc, :vidre_simple, :vidre_doble, :vidre_triple, :vidre_baix_emissiu, :vidre_control_solar, :sobrecarrega_repartida_balco, :sobrecarrega_linial_vora_balco)
    end
end
