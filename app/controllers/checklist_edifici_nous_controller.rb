class ChecklistEdificiNousController < ApplicationController
  #before_action :set_checklist_edifici_nou, only: [:show, :edit, :update, :destroy]

  def quadern
    @edifici = Edifici.find(params[:id])
    @checklist_quadern = ChecklistEdificiNou.find(params[:id])
  end

  def det
  end

  def manuals
  end

  def arxiu
  end

  # GET /checklist_edifici_nous
  # GET /checklist_edifici_nous.json
  #def index
  #  @checklist_edifici_nous = ChecklistEdificiNou.all
  #end

  # GET /checklist_edifici_nous/1
  # GET /checklist_edifici_nous/1.json
  #def show
  #end

  # GET /checklist_edifici_nous/new
  #def new
  #  @checklist_edifici_nou = ChecklistEdificiNou.new
  #end

  # GET /checklist_edifici_nous/1/edit
  #def edit
  #end

  # POST /checklist_edifici_nous
  # POST /checklist_edifici_nous.json
  def create
    @checklist_edifici_nou = ChecklistEdificiNou.new(checklist_edifici_nou_params)

    respond_to do |format|
      if @checklist_edifici_nou.save
        format.html { redirect_to @checklist_edifici_nou, notice: 'Checklist edifici nou was successfully created.' }
        format.json { render :show, status: :created, location: @checklist_edifici_nou }
      else
        format.html { render :new }
        format.json { render json: @checklist_edifici_nou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_edifici_nous/1
  # PATCH/PUT /checklist_edifici_nous/1.json
  def update
    respond_to do |format|
      if @checklist_edifici_nou.update(checklist_edifici_nou_params)
        format.html { redirect_to @checklist_edifici_nou, notice: 'Checklist edifici nou was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist_edifici_nou }
      else
        format.html { render :edit }
        format.json { render json: @checklist_edifici_nou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_edifici_nous/1
  # DELETE /checklist_edifici_nous/1.json
  def destroy
    @checklist_edifici_nou.destroy
    respond_to do |format|
      format.html { redirect_to checklist_edifici_nous_url, notice: 'Checklist edifici nou was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_edifici_nou
      @checklist_edifici_nou = ChecklistEdificiNou.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_edifici_nou_params
      params.require(:checklist_edifici_nou).permit(:edifici_id, :dades, :planol_emplacament, :foto_facana, :promotor, :projectista, :constructor, :director, :director_execucio, :laboratori, :entitat_control, :subministrador, :industrial, :llicencia, :declaracio_obra_nova, :regim_propietat, :carregues, :entitats_juridiques, :acta_lliurament, :canvis_titularitat, :reformes, :canvis_dades_inicials, :ajuts, :assegurances, :enunciats_incidencies, :registre_operacions_manteniment, :registre_operacions_reparacio, :registre_operacions_millora, :registre_actuacions_arquitectoniques, :planols, :esquemes_instalacions, :descripcio_pes, :instruccions_us_manteniment, :documents_substitucio, :recomanacions_emergencies, :planols_habitatge, :planols_elements_privatius, :instruccions_us_manteniment_habitatge, :garanties_manuals_equips, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :documents_garantia_parts_comunes, :certificacio_energetica, :polissa_assegurances, :escriptura_propietat_horitzontal, :estatus_comunitat, :cedules_regims_juridics, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :certificat_final_obra_instalacions, :declaracions_ce_ascensors)
    end
end
