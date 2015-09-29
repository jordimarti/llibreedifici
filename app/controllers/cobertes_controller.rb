class CobertesController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /cobertes
  # GET /cobertes.json
  def index
    @cobertes = Coberta.all
  end

  # GET /cobertes/1
  # GET /cobertes/1.json
  def show
  end

  # GET /cobertes/new
  def new
    @coberta = Coberta.new
  end

  # GET /cobertes/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.coberta.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'coberta'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'coberta')
  end

  # POST /cobertes
  # POST /cobertes.json
  def create
    @coberta = Coberta.new(coberta_params)

    respond_to do |format|
      if @coberta.save
        format.html { redirect_to @coberta, notice: 'Coberta was successfully created.' }
        format.json { render :show, status: :created, location: @coberta }
      else
        format.html { render :new }
        format.json { render json: @coberta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cobertes/1
  # PATCH/PUT /cobertes/1.json
  def update
    respond_to do |format|
      if @coberta.update(coberta_params)
        format.html { redirect_to edit_edifici_coberta_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @coberta }
      else
        format.html { render :edit }
        format.json { render json: @coberta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cobertes/1
  # DELETE /cobertes/1.json
  def destroy
    @coberta.destroy
    respond_to do |format|
      format.html { redirect_to cobertes_url, notice: 'Coberta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def coberta_params
      params.require(:coberta).permit(:edifici_id, :terrat_transitable, :terrat_no_transitable, :terrat_tradicional, :terrat_invertida, :terrat_lamina_bituminosa_oxiasfalt, :terrat_lamina_bituminosa_betum, :terrat_lamina_pvc_resistent, :terrat_lamina_pvc_no_resistent, :terrat_lamina_epdm, :terrat_lamina_cautxu, :terrat_lamina_polietile, :terrat_lamina_plaques_bituminoses, :terrat_lamina_cautxu_sintetic, :terrat_lamina_pastes_bituminoses, :terrat_junta_dilatacio_cautxu_butil, :terrat_junta_dilatacio_cautxu_sintetic, :terrat_junta_dilatacio_emulsions_bituminoses, :terrat_junta_dilatacio_silicona, :terrat_acabat_enrajolat, :terrat_acabat_lloses_flotants, :terrat_acabat_graveta, :terrat_acabat_lamina_autoprotegida, :coberta_teula_arab, :coberta_teula_plana, :coberta_teula_ciment, :coberta_pissarra, :coberta_fibrociment, :coberta_asfaltica, :coberta_xapa_acer, :coberta_xapa_coure, :coberta_aillament_termic, :lluernes_fixes, :lluernes_practicables, :lluernes_entramat_formigo, :lluernes_perfils_alumini, :lluernes_entramat_acer, :lluernes_emmotllats_vidre, :lluernes_vidre_armat, :lluernes_vidre_laminat, :lluernes_poliester, :lluernes_policarbonat, :aillament_cambra_ventilada, :aillament_material_adossat, :aillament_formigo_alleugerit_aire, :aillament_formigo_alleugerit_arids, :aillament_lamines, :aillament_amorf, :aillament_mantes, :aillament_plaques, :aillament_poliestire_expandit, :aillament_poliestire_estrudit, :aillament_polietile_expandit, :aillament_polietile_reticulat, :aillament_fibra_vidre, :aillament_llana_roca, :aillament_fibres_textils, :aillament_fibres_celulosa, :aillament_escuma_poliureta, :aillament_escuma_fenolica, :aillament_escuma_resina_melamina, :aillament_argila_expandida, :aillament_perlita_expandida, :aillament_gruix)
    end
end
