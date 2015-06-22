class DadesEdificiExistentsController < ApplicationController
  before_action :set_dades_edifici_existent, only: [:show, :edit, :update, :destroy]
  layout 'dades'
  
  # GET /dades_edifici_existents
  # GET /dades_edifici_existents.json
  def index
    @dades_edifici_existents = DadesEdificiExistent.all
  end

  # GET /dades_edifici_existents/1
  # GET /dades_edifici_existents/1.json
  def show
  end

  # GET /dades_edifici_existents/new
  def new
    @dades_edifici_existent = DadesEdificiExistent.new
  end

  # GET /dades_edifici_existents/1/edit
  def edit
  end

  # POST /dades_edifici_existents
  # POST /dades_edifici_existents.json
  def create
    @dades_edifici_existent = DadesEdificiExistent.new(dades_edifici_existent_params)

    respond_to do |format|
      if @dades_edifici_existent.save
        format.html { redirect_to @dades_edifici_existent, notice: 'Dades edifici existent was successfully created.' }
        format.json { render :show, status: :created, location: @dades_edifici_existent }
      else
        format.html { render :new }
        format.json { render json: @dades_edifici_existent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dades_edifici_existents/1
  # PATCH/PUT /dades_edifici_existents/1.json
  def update
    respond_to do |format|
      if @dades_edifici_existent.update(dades_edifici_existent_params)
        format.html { redirect_to @dades_edifici_existent, notice: 'Dades edifici existent was successfully updated.' }
        format.json { render :show, status: :ok, location: @dades_edifici_existent }
      else
        format.html { render :edit }
        format.json { render json: @dades_edifici_existent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dades_edifici_existents/1
  # DELETE /dades_edifici_existents/1.json
  def destroy
    @dades_edifici_existent.destroy
    respond_to do |format|
      format.html { redirect_to dades_edifici_existents_url, notice: 'Dades edifici existent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dades_edifici_existent
      @dades_edifici_existent = DadesEdificiExistent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dades_edifici_existent_params
      params.require(:dades_edifici_existent).permit(:edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici)
    end
end
