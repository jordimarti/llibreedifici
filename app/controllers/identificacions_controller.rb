class IdentificacionsController < ApplicationController
  include CheckUser
  before_action :set_identificacio, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  layout 'edifici'

  # GET /identificacions
  # GET /identificacions.json
  def index
    @identificacions = Identificacio.all
  end

  # GET /identificacions/1
  # GET /identificacions/1.json
  def show
  end

  # GET /identificacions/new
  def new
    @identificacio = Identificacio.new
  end

  # GET /identificacions/1/edit
  def edit
    check_user_edifici
    if @edifici.identificacio.id != @identificacio.id
      redirect_to root_path
    end
    @submenu_actiu = 'identificacio'
  end

  # POST /identificacions
  # POST /identificacions.json
  def create
    @identificacio = Identificacio.new(identificacio_params)

    respond_to do |format|
      if @identificacio.save
        format.html { redirect_to @identificacio, notice: 'Identificacio was successfully created.' }
        format.json { render :show, status: :created, location: @identificacio }
      else
        format.html { render :new }
        format.json { render json: @identificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identificacions/1
  # PATCH/PUT /identificacions/1.json
  def update
    respond_to do |format|
      if @identificacio.update(identificacio_params)
        format.html { redirect_to edit_edifici_identificacio_path, notice: 'Identificacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @identificacio }
      else
        format.html { render :edit }
        format.json { render json: @identificacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identificacions/1
  # DELETE /identificacions/1.json
  def destroy
    @identificacio.destroy
    respond_to do |format|
      format.html { redirect_to identificacions_url, notice: 'Identificacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identificacio
      @identificacio = Identificacio.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def identificacio_params
      params.require(:identificacio).permit(:edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici, :any_inici_construccio, :any_fi_construccio, :origen_any_construccio)
    end
end
