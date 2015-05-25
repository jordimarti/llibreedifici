class EntitatControlsController < ApplicationController
  before_action :set_entitat_control, only: [:show, :edit, :update, :destroy]

  # GET /entitat_controls
  # GET /entitat_controls.json
  def index
    @entitat_controls = EntitatControl.all
  end

  # GET /entitat_controls/1
  # GET /entitat_controls/1.json
  def show
  end

  # GET /entitat_controls/new
  def new
    @entitat_control = EntitatControl.new
  end

  # GET /entitat_controls/1/edit
  def edit
  end

  # POST /entitat_controls
  # POST /entitat_controls.json
  def create
    @entitat_control = EntitatControl.new(entitat_control_params)

    respond_to do |format|
      if @entitat_control.save
        format.html { redirect_to @entitat_control, notice: 'Entitat control was successfully created.' }
        format.json { render :show, status: :created, location: @entitat_control }
      else
        format.html { render :new }
        format.json { render json: @entitat_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entitat_controls/1
  # PATCH/PUT /entitat_controls/1.json
  def update
    respond_to do |format|
      if @entitat_control.update(entitat_control_params)
        format.html { redirect_to @entitat_control, notice: 'Entitat control was successfully updated.' }
        format.json { render :show, status: :ok, location: @entitat_control }
      else
        format.html { render :edit }
        format.json { render json: @entitat_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entitat_controls/1
  # DELETE /entitat_controls/1.json
  def destroy
    @entitat_control.destroy
    respond_to do |format|
      format.html { redirect_to entitat_controls_url, notice: 'Entitat control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entitat_control
      @entitat_control = EntitatControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entitat_control_params
      params.require(:entitat_control).permit(:edifici_id, :nom_entitat_control, :nif_entitat_control, :tipus_via_entitat_control, :via_entitat_control, :numero_entitat_control, :bloc_entitat_control, :escala_entitat_control, :pis_entitat_control, :cp_entitat_control, :poblacio_entitat_control, :provincia_entitat_control, :pais_entitat_control)
    end
end
