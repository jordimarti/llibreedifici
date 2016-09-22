class ChecklistExistentPlurifamiliarsController < ApplicationController
  before_action :set_checklist_existent_plurifamiliar, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  layout 'edifici'

  # GET /checklist_existent_plurifamiliars
  # GET /checklist_existent_plurifamiliars.json
  def index
    @checklist_existent_plurifamiliars = ChecklistExistentPlurifamiliar.all
  end

  # GET /checklist_existent_plurifamiliars/1
  # GET /checklist_existent_plurifamiliars/1.json
  def show
  end

  # GET /checklist_existent_plurifamiliars/new
  def new
    @checklist_existent_plurifamiliar = ChecklistExistentPlurifamiliar.new
  end

  # GET /checklist_existent_plurifamiliars/1/edit
  def edit
    @submenu_actiu = 'documents'
    @signatura_llibres = SignaturaLlibre.where(:edifici_id => params[:edifici_id])
    @signatura_instruccions = SignaturaInstruccion.where(:edifici_id => params[:edifici_id])
  end

  # POST /checklist_existent_plurifamiliars
  # POST /checklist_existent_plurifamiliars.json
  def create
    @checklist_existent_plurifamiliar = ChecklistExistentPlurifamiliar.new(checklist_existent_plurifamiliar_params)

    respond_to do |format|
      if @checklist_existent_plurifamiliar.save
        format.html { redirect_to @checklist_existent_plurifamiliar, notice: 'Checklist existent plurifamiliar was successfully created.' }
        format.json { render :show, status: :created, location: @checklist_existent_plurifamiliar }
      else
        format.html { render :new }
        format.json { render json: @checklist_existent_plurifamiliar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_existent_plurifamiliars/1
  # PATCH/PUT /checklist_existent_plurifamiliars/1.json
  def update
    respond_to do |format|
      if @checklist_existent_plurifamiliar.update(checklist_existent_plurifamiliar_params)
        format.html { redirect_to documents_path(@edifici.id) }
        format.json { render :show, status: :ok, location: @checklist_existent_plurifamiliar }
      else
        format.html { render :edit }
        format.json { render json: @checklist_existent_plurifamiliar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_existent_plurifamiliars/1
  # DELETE /checklist_existent_plurifamiliars/1.json
  def destroy
    @checklist_existent_plurifamiliar.destroy
    respond_to do |format|
      format.html { redirect_to checklist_existent_plurifamiliars_url, notice: 'Checklist existent plurifamiliar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_existent_plurifamiliar
      @checklist_existent_plurifamiliar = ChecklistExistentPlurifamiliar.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_existent_plurifamiliar_params
      params.require(:checklist_existent_plurifamiliar).permit(:edifici_id, :iite, :document_lliurament_iite, :comunicat_ens_local, :programa_rehabilitacio, :certificat_final_obra, :certificat_aptitud, :certificacio_energetica, :instruccions_us, :documents_justificatius_operacions, :pressupostos_obres, :certificats_instalacions_comunes, :certificats_inspeccions_tecniques)
    end
end
