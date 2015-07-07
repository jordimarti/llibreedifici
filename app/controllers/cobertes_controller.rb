class CobertesController < ApplicationController
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /cobertes
  # GET /cobertes.json
  def index
    @cobertes = Coberta.all
  end

  # GET /cobertes/1
  # GET /cobertes/1.json
  def show
  end

  # GET /cobertes/new
  def new
    @coberta = Coberta.new
  end

  # GET /cobertes/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'coberta'
  end

  # POST /cobertes
  # POST /cobertes.json
  def create
    @coberta = Coberta.new(coberta_params)

    respond_to do |format|
      if @coberta.save
        format.html { redirect_to @coberta, notice: 'Coberta was successfully created.' }
        format.json { render :show, status: :created, location: @coberta }
      else
        format.html { render :new }
        format.json { render json: @coberta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cobertes/1
  # PATCH/PUT /cobertes/1.json
  def update
    respond_to do |format|
      if @coberta.update(coberta_params)
        format.html { redirect_to edit_edifici_coberta_path }
        format.json { render :show, status: :ok, location: @coberta }
      else
        format.html { render :edit }
        format.json { render json: @coberta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cobertes/1
  # DELETE /cobertes/1.json
  def destroy
    @coberta.destroy
    respond_to do |format|
      format.html { redirect_to cobertes_url, notice: 'Coberta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def coberta_params
      params.require(:coberta).permit(:edifici_id, :terrat_transitable, :terrat_no_transitable, :terrat_aillament_termic, :terrat_lamina_impermeabilitzant, :coberta_teula_arab, :coberta_teula_plana, :coberta_teula_ciment, :coberta_pissarra, :coberta_fibrociment, :coberta_asfaltica, :coberta_xapa_acer, :coberta_xapa_coure, :coberta_aillament_termic)
    end
end
