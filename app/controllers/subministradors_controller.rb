class SubministradorsController < ApplicationController
  before_action :set_subministrador, only: [:show, :edit, :update, :destroy]

  # GET /subministradors
  # GET /subministradors.json
  def index
    @subministradors = Subministrador.all
  end

  # GET /subministradors/1
  # GET /subministradors/1.json
  def show
  end

  # GET /subministradors/new
  def new
    @subministrador = Subministrador.new
  end

  # GET /subministradors/1/edit
  def edit
  end

  # POST /subministradors
  # POST /subministradors.json
  def create
    @subministrador = Subministrador.new(subministrador_params)

    respond_to do |format|
      if @subministrador.save
        format.html { redirect_to @subministrador, notice: 'Subministrador was successfully created.' }
        format.json { render :show, status: :created, location: @subministrador }
      else
        format.html { render :new }
        format.json { render json: @subministrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subministradors/1
  # PATCH/PUT /subministradors/1.json
  def update
    respond_to do |format|
      if @subministrador.update(subministrador_params)
        format.html { redirect_to @subministrador, notice: 'Subministrador was successfully updated.' }
        format.json { render :show, status: :ok, location: @subministrador }
      else
        format.html { render :edit }
        format.json { render json: @subministrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subministradors/1
  # DELETE /subministradors/1.json
  def destroy
    @subministrador.destroy
    respond_to do |format|
      format.html { redirect_to subministradors_url, notice: 'Subministrador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subministrador
      @subministrador = Subministrador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subministrador_params
      params.require(:subministrador).permit(:edifici_id, :nom_subministrador, :nif_subministrador, :tipus_via_subministrador, :via_subministrador, :numero_subministrador, :bloc_subministrador, :escala_subministrador, :pis_subministrador, :cp_subministrador, :poblacio_subministrador, :provincia_subministrador, :pais_subministrador)
    end
end
