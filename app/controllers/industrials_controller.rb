class IndustrialsController < ApplicationController
  before_action :set_industrial, only: [:show, :edit, :update, :destroy]

  # GET /industrials
  # GET /industrials.json
  def index
    @industrials = Industrial.all
  end

  # GET /industrials/1
  # GET /industrials/1.json
  def show
  end

  # GET /industrials/new
  def new
    @industrial = Industrial.new
  end

  # GET /industrials/1/edit
  def edit
  end

  # POST /industrials
  # POST /industrials.json
  def create
    @industrial = Industrial.new(industrial_params)

    respond_to do |format|
      if @industrial.save
        format.html { redirect_to @industrial, notice: 'Industrial was successfully created.' }
        format.json { render :show, status: :created, location: @industrial }
      else
        format.html { render :new }
        format.json { render json: @industrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industrials/1
  # PATCH/PUT /industrials/1.json
  def update
    respond_to do |format|
      if @industrial.update(industrial_params)
        format.html { redirect_to @industrial, notice: 'Industrial was successfully updated.' }
        format.json { render :show, status: :ok, location: @industrial }
      else
        format.html { render :edit }
        format.json { render json: @industrial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industrials/1
  # DELETE /industrials/1.json
  def destroy
    @industrial.destroy
    respond_to do |format|
      format.html { redirect_to industrials_url, notice: 'Industrial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrial
      @industrial = Industrial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrial_params
      params.require(:industrial).permit(:edifici_id, :nom_industrial, :nif_industrial, :tipus_via_industrial, :via_industrial, :numero_industrial, :bloc_industrial, :escala_industrial, :pis_industrial, :cp_industrial, :poblacio_industrial, :provincia_industrial, :pais_industrial)
    end
end
