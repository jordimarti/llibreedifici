class ChecklistEdificiNouPlurifamiliarsController < ApplicationController
  before_action :set_checklist_edifici_nou_plurifamiliar, only: [:show, :edit, :update, :destroy]
  layout 'checklist'

  # GET /checklist_edifici_nou_plurifamiliars
  # GET /checklist_edifici_nou_plurifamiliars.json
  #def index
  #  @checklist_edifici_nou_plurifamiliars = ChecklistEdificiNouPlurifamiliar.all
  #end

  # GET /checklist_edifici_nou_plurifamiliars/1
  # GET /checklist_edifici_nou_plurifamiliars/1.json
  #def show
  #end

  # GET /checklist_edifici_nou_plurifamiliars/new
  #def new
  #  @checklist_edifici_nou_plurifamiliar = ChecklistEdificiNouPlurifamiliar.new
  #end

  # GET /checklist_edifici_nou_plurifamiliars/1/edit
  #def edit
  #end

  def quadern
    @menu_actiu = 'quadern'
    @edifici = Edifici.find(params[:id])
    if @edifici.user_id != current_user.id
      redirect_to controller: "home", action: "permisos"
    end
    @checklist = ChecklistEdificiNouPlurifamiliar.where(edifici_id: params[:id]).last
  end

  # POST /checklist_edifici_nou_plurifamiliars
  # POST /checklist_edifici_nou_plurifamiliars.json
  def create
    @checklist_edifici_nou_plurifamiliar = ChecklistEdificiNouPlurifamiliar.new(checklist_edifici_nou_plurifamiliar_params)

    respond_to do |format|
      if @checklist_edifici_nou_plurifamiliar.save
        format.html { redirect_to @checklist_edifici_nou_plurifamiliar, notice: 'Checklist edifici nou plurifamiliar was successfully created.' }
        format.json { render :show, status: :created, location: @checklist_edifici_nou_plurifamiliar }
      else
        format.html { render :new }
        format.json { render json: @checklist_edifici_nou_plurifamiliar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_edifici_nou_plurifamiliars/1
  # PATCH/PUT /checklist_edifici_nou_plurifamiliars/1.json
  def update
    respond_to do |format|
      if @checklist_edifici_nou_plurifamiliar.update(checklist_edifici_nou_plurifamiliar_params)
        format.html { redirect_to @checklist_edifici_nou_plurifamiliar, notice: 'Checklist edifici nou plurifamiliar was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist_edifici_nou_plurifamiliar }
      else
        format.html { render :edit }
        format.json { render json: @checklist_edifici_nou_plurifamiliar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_edifici_nou_plurifamiliars/1
  # DELETE /checklist_edifici_nou_plurifamiliars/1.json
  def destroy
    @checklist_edifici_nou_plurifamiliar.destroy
    respond_to do |format|
      format.html { redirect_to checklist_edifici_nou_plurifamiliars_url, notice: 'Checklist edifici nou plurifamiliar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_edifici_nou_plurifamiliar
      @checklist_edifici_nou_plurifamiliar = ChecklistEdificiNouPlurifamiliar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_edifici_nou_plurifamiliar_params
      params.require(:checklist_edifici_nou_plurifamiliar).permit(:edifici_id, :dades, :planol_emplacament, :foto_facana, :promotor, :projectista, :constructor, :director, :director_execucio, :laboratori, :entitat_control, :subministrador, :industrial, :llicencia, :declaracio_obra_nova, :regim_propietat, :carregues, :entitats_juridiques, :acta_lliurament, :canvis_titularitat, :reformes, :canvis_dades_inicials, :ajuts, :assegurances, :enunciats_incidencies, :registre_operacions_manteniment, :registre_operacions_reparacio, :registre_operacions_millora, :registre_actuacions_arquitectoniques, :planols, :esquemes_instalacions, :descripcio_pes, :instruccions_us_manteniment, :documents_substitucio, :recomanacions_emergencies, :planols_habitatge, :planols_elements_privatius, :instruccions_us_manteniment_habitatge, :garanties_manuals_equips, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :documents_garantia_parts_comunes, :certificacio_energetica, :polissa_assegurances, :escriptura_propietat_horitzontal, :estatus_comunitat, :cedules_regims_juridics, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :certificat_final_obra_instalacions, :declaracions_ce_ascensors)
    end
end
