class RegimPropietatsController < ApplicationController
  before_action :set_regim_propietat, only: [:show, :edit, :update, :destroy]

  # GET /regim_propietats
  # GET /regim_propietats.json
  def index
    @regim_propietats = RegimPropietat.all
  end

  # GET /regim_propietats/1
  # GET /regim_propietats/1.json
  def show
  end

  # GET /regim_propietats/new
  def new
    @regim_propietat = RegimPropietat.new
  end

  # GET /regim_propietats/1/edit
  def edit
  end

  # POST /regim_propietats
  # POST /regim_propietats.json
  def create
    @regim_propietat = RegimPropietat.new(regim_propietat_params)

    respond_to do |format|
      if @regim_propietat.save
        format.html { redirect_to @regim_propietat, notice: 'Regim propietat was successfully created.' }
        format.json { render :show, status: :created, location: @regim_propietat }
      else
        format.html { render :new }
        format.json { render json: @regim_propietat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regim_propietats/1
  # PATCH/PUT /regim_propietats/1.json
  def update
    respond_to do |format|
      if @regim_propietat.update(regim_propietat_params)
        format.html { redirect_to @regim_propietat, notice: 'Regim propietat was successfully updated.' }
        format.json { render :show, status: :ok, location: @regim_propietat }
      else
        format.html { render :edit }
        format.json { render json: @regim_propietat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regim_propietats/1
  # DELETE /regim_propietats/1.json
  def destroy
    @regim_propietat.destroy
    respond_to do |format|
      format.html { redirect_to regim_propietats_url, notice: 'Regim propietat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regim_propietat
      @regim_propietat = RegimPropietat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regim_propietat_params
      params.require(:regim_propietat).permit(:edifici_id, :tipus_regim_propietat, :document_escriptura)
    end
end
