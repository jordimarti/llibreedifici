class LaboratorisController < ApplicationController
  before_action :set_laboratori, only: [:show, :edit, :update, :destroy]

  # GET /laboratoris
  # GET /laboratoris.json
  def index
    @laboratoris = Laboratori.all
  end

  # GET /laboratoris/1
  # GET /laboratoris/1.json
  def show
  end

  # GET /laboratoris/new
  def new
    @laboratori = Laboratori.new
  end

  # GET /laboratoris/1/edit
  def edit
  end

  # POST /laboratoris
  # POST /laboratoris.json
  def create
    @laboratori = Laboratori.new(laboratori_params)

    respond_to do |format|
      if @laboratori.save
        format.html { redirect_to @laboratori, notice: 'Laboratori was successfully created.' }
        format.json { render :show, status: :created, location: @laboratori }
      else
        format.html { render :new }
        format.json { render json: @laboratori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratoris/1
  # PATCH/PUT /laboratoris/1.json
  def update
    respond_to do |format|
      if @laboratori.update(laboratori_params)
        format.html { redirect_to @laboratori, notice: 'Laboratori was successfully updated.' }
        format.json { render :show, status: :ok, location: @laboratori }
      else
        format.html { render :edit }
        format.json { render json: @laboratori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratoris/1
  # DELETE /laboratoris/1.json
  def destroy
    @laboratori.destroy
    respond_to do |format|
      format.html { redirect_to laboratoris_url, notice: 'Laboratori was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratori
      @laboratori = Laboratori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laboratori_params
      params.require(:laboratori).permit(:edifici_id, :nom_laboratori, :nif_laboratori)
    end
end
