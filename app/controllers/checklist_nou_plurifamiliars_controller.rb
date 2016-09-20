class ChecklistNouPlurifamiliarsController < ApplicationController
  before_action :set_checklist_nou_plurifamiliar, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  layout 'edifici'

  # GET /checklist_nou_plurifamiliars
  # GET /checklist_nou_plurifamiliars.json
  def index
    @checklist_nou_plurifamiliars = ChecklistNouPlurifamiliar.all
  end

  # GET /checklist_nou_plurifamiliars/1
  # GET /checklist_nou_plurifamiliars/1.json
  def show
  end

  # GET /checklist_nou_plurifamiliars/new
  def new
    @checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.new
  end

  # GET /checklist_nou_plurifamiliars/1/edit
  def edit
    @submenu_actiu = 'documents'
    @signatura_promotors = SignaturaPromotor.where(:edifici_id => params[:edifici_id])
  end

  # POST /checklist_nou_plurifamiliars
  # POST /checklist_nou_plurifamiliars.json
  def create
    @checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.new(checklist_nou_plurifamiliar_params)

    respond_to do |format|
      if @checklist_nou_plurifamiliar.save
        format.html { redirect_to @checklist_nou_plurifamiliar, notice: 'Checklist nou plurifamiliar was successfully created.' }
        format.json { render :show, status: :created, location: @checklist_nou_plurifamiliar }
      else
        format.html { render :new }
        format.json { render json: @checklist_nou_plurifamiliar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_nou_plurifamiliars/1
  # PATCH/PUT /checklist_nou_plurifamiliars/1.json
  def update
    respond_to do |format|
      if @checklist_nou_plurifamiliar.update(checklist_nou_plurifamiliar_params)
        format.html { redirect_to documents_path(@edifici.id) }
        format.json { render :show, status: :ok, location: @checklist_nou_plurifamiliar }
      else
        format.html { render :edit }
        format.json { render json: @checklist_nou_plurifamiliar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_nou_plurifamiliars/1
  # DELETE /checklist_nou_plurifamiliars/1.json
  def destroy
    @checklist_nou_plurifamiliar.destroy
    respond_to do |format|
      format.html { redirect_to checklist_nou_plurifamiliars_url, notice: 'Checklist nou plurifamiliar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_nou_plurifamiliar
      @checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_nou_plurifamiliar_params
      params.require(:checklist_nou_plurifamiliar).permit(:edifici_id, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :documents_garantia_parts_comunes, :certificacio_energetica, :polissa_assegurances, :escriptura_propietat_horitzontal, :estatus_comunitat, :cedules_regims_juridics, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :certificat_final_obra_instalacions, :declaracions_ce_ascensors)
    end
end
