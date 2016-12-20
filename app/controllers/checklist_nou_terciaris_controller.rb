class ChecklistNouTerciarisController < ApplicationController
  before_action :set_checklist_nou_terciari, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  layout 'edifici'

  # GET /checklist_nou_terciaris
  # GET /checklist_nou_terciaris.json
  def index
    @checklist_nou_terciaris = ChecklistNouTerciari.all
  end

  # GET /checklist_nou_terciaris/1
  # GET /checklist_nou_terciaris/1.json
  def show
  end

  # GET /checklist_nou_terciaris/new
  def new
    @checklist_nou_terciari = ChecklistNouTerciari.new
  end

  # GET /checklist_nou_terciaris/1/edit
  def edit
    @submenu_actiu = 'documents'
    @signatura_promotors = SignaturaPromotor.where(:edifici_id => params[:edifici_id])
    @signatura_llibres = SignaturaLlibre.where(:edifici_id => params[:edifici_id])
    @signatura_instruccions = SignaturaInstruccion.where(:edifici_id => params[:edifici_id])
  end

  # POST /checklist_nou_terciaris
  # POST /checklist_nou_terciaris.json
  def create
    @checklist_nou_terciari = ChecklistNouTerciari.new(checklist_nou_terciari_params)

    respond_to do |format|
      if @checklist_nou_terciari.save
        format.html { redirect_to @checklist_nou_terciari, notice: 'Checklist nou terciari was successfully created.' }
        format.json { render :show, status: :created, location: @checklist_nou_terciari }
      else
        format.html { render :new }
        format.json { render json: @checklist_nou_terciari.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_nou_terciaris/1
  # PATCH/PUT /checklist_nou_terciaris/1.json
  def update
    respond_to do |format|
      if @checklist_nou_terciari.update(checklist_nou_terciari_params)
        format.html { redirect_to @checklist_nou_terciari, notice: 'Checklist nou terciari was successfully updated.' }
        format.json { render :show, status: :ok, location: @checklist_nou_terciari }
      else
        format.html { render :edit }
        format.json { render json: @checklist_nou_terciari.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_nou_terciaris/1
  # DELETE /checklist_nou_terciaris/1.json
  def destroy
    @checklist_nou_terciari.destroy
    respond_to do |format|
      format.html { redirect_to checklist_nou_terciaris_url, notice: 'Checklist nou terciari was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_nou_terciari
      @checklist_nou_terciari = ChecklistNouTerciari.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_nou_terciari_params
      params.require(:checklist_nou_terciari).permit(:edifici_id, :llicencies_preceptives, :certificat_final_obra, :acta_recepcio_obra, :escriptura_publica, :documents_garantia, :certificacio_energetica, :polissa_assegurances, :carregues_reals, :documents_complementaris, :documents_acreditatius_ajuts, :documents_justificacio_operacions, :declaracions_ce_ascensors)
    end
end
