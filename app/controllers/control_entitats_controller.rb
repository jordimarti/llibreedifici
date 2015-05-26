class ControlEntitatsController < ApplicationController
  before_action :set_control_entitat, only: [:show, :edit, :update, :destroy]

  # GET /control_entitats
  # GET /control_entitats.json
  def index
    @control_entitats = ControlEntitat.all
  end

  # GET /control_entitats/1
  # GET /control_entitats/1.json
  def show
  end

  # GET /control_entitats/new
  def new
    @control_entitat = ControlEntitat.new
  end

  # GET /control_entitats/1/edit
  def edit
  end

  # POST /control_entitats
  # POST /control_entitats.json
  def create
    @control_entitat = ControlEntitat.new(control_entitat_params)

    respond_to do |format|
      if @control_entitat.save
        format.html { redirect_to @control_entitat, notice: 'Control entitat was successfully created.' }
        format.json { render :show, status: :created, location: @control_entitat }
      else
        format.html { render :new }
        format.json { render json: @control_entitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_entitats/1
  # PATCH/PUT /control_entitats/1.json
  def update
    respond_to do |format|
      if @control_entitat.update(control_entitat_params)
        format.html { redirect_to @control_entitat, notice: 'Control entitat was successfully updated.' }
        format.json { render :show, status: :ok, location: @control_entitat }
      else
        format.html { render :edit }
        format.json { render json: @control_entitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_entitats/1
  # DELETE /control_entitats/1.json
  def destroy
    @control_entitat.destroy
    respond_to do |format|
      format.html { redirect_to control_entitats_url, notice: 'Control entitat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control_entitat
      @control_entitat = ControlEntitat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_entitat_params
      params.require(:control_entitat).permit(:edifici_id, :nom_entitat_control, :nif_entitat_control, :tipus_via_entitat_control, :via_entitat_control, :numero_entitat_control, :bloc_entitat_control, :escala_entitat_control, :pis_entitat_control, :cp_entitat_control, :poblacio_entitat_control, :provincia_entitat_control, :pais_entitat_control)
    end
end
