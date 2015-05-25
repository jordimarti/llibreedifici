class DadesEdificisController < ApplicationController
  before_action :set_dades_edifici, only: [:show, :edit, :update, :destroy]

  # GET /dades_edificis
  # GET /dades_edificis.json
  def index
    @dades_edificis = DadesEdifici.all
  end

  # GET /dades_edificis/1
  # GET /dades_edificis/1.json
  def show
  end

  # GET /dades_edificis/new
  def new
    @dades_edifici = DadesEdifici.new
  end

  # GET /dades_edificis/1/edit
  def edit
  end

  # POST /dades_edificis
  # POST /dades_edificis.json
  def create
    @dades_edifici = DadesEdifici.new(dades_edifici_params)

    respond_to do |format|
      if @dades_edifici.save
        format.html { redirect_to @dades_edifici, notice: 'Dades edifici was successfully created.' }
        format.json { render :show, status: :created, location: @dades_edifici }
      else
        format.html { render :new }
        format.json { render json: @dades_edifici.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dades_edificis/1
  # PATCH/PUT /dades_edificis/1.json
  def update
    respond_to do |format|
      if @dades_edifici.update(dades_edifici_params)
        format.html { redirect_to @dades_edifici, notice: 'Dades edifici was successfully updated.' }
        format.json { render :show, status: :ok, location: @dades_edifici }
      else
        format.html { render :edit }
        format.json { render json: @dades_edifici.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dades_edificis/1
  # DELETE /dades_edificis/1.json
  def destroy
    @dades_edifici.destroy
    respond_to do |format|
      format.html { redirect_to dades_edificis_url, notice: 'Dades edifici was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dades_edifici
      @dades_edifici = DadesEdifici.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dades_edifici_params
      params.require(:dades_edifici).permit(:edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici, :any_inici_construccio, :any_fi_construccio)
    end
end
