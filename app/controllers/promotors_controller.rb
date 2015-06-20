class PromotorsController < ApplicationController
  before_action :set_promotor, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici

  # GET /promotors
  # GET /promotors.json
  def index
    @promotors = Promotor.all
  end

  # GET /promotors/1
  # GET /promotors/1.json
  def show
  end

  # GET /promotors/new
  def new
    @promotor = Promotor.new
  end

  # GET /promotors/1/edit
  def edit
  end

  # POST /promotors
  # POST /promotors.json
  def create
    @promotor = Promotor.new(promotor_params)

    respond_to do |format|
      if @promotor.save
        format.html { redirect_to [@edifici, @promotor], notice: 'Promotor was successfully created.' }
        format.json { render :show, status: :created, location: @promotor }
      else
        format.html { render :new }
        format.json { render json: @promotor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotors/1
  # PATCH/PUT /promotors/1.json
  def update
    respond_to do |format|
      if @promotor.update(promotor_params)
        format.html { redirect_to [@edifici, @promotor], notice: 'Promotor was successfully updated.' }
        format.json { render :show, status: :ok, location: @promotor }
      else
        format.html { render :edit }
        format.json { render json: @promotor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotors/1
  # DELETE /promotors/1.json
  def destroy
    @promotor.destroy
    respond_to do |format|
      format.html { redirect_to edifici_promotors_url, notice: 'Promotor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotor
      @promotor = Promotor.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotor_params
      params.require(:promotor).permit(:edifici_id, :nom_promotor, :nif_promotor, :tipus_via_promotor, :via_promotor, :numero_promotor, :bloc_promotor, :escala_promotor, :pis_promotor, :cp_promotor, :poblacio_promotor, :provincia_promotor, :pais_promotor)
    end
end
