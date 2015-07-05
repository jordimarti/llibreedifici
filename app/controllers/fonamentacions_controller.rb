class FonamentacionsController < ApplicationController
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  layout 'edifici'

  # GET /fonamentacions
  # GET /fonamentacions.json
  def index
    @fonamentacions = Fonamentacio.all
  end

  # GET /fonamentacions/1
  # GET /fonamentacions/1.json
  def show
  end

  # GET /fonamentacions/new
  def new
    @fonamentacio = Fonamentacio.new
  end

  # GET /fonamentacions/1/edit
  def edit
    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'fonamentacio'
  end

  # POST /fonamentacions
  # POST /fonamentacions.json
  def create
    @fonamentacio = Fonamentacio.new(fonamentacio_params)

    respond_to do |format|
      if @fonamentacio.save
        format.html { redirect_to @fonamentacio, notice: 'Fonamentacio was successfully created.' }
        format.json { render :show, status: :created, location: @fonamentacio }
      else
        format.html { render :new }
        format.json { render json: @fonamentacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fonamentacions/1
  # PATCH/PUT /fonamentacions/1.json
  def update
    respond_to do |format|
      if @fonamentacio.update(fonamentacio_params)
        format.html { redirect_to edit_edifici_fonamentacio_path }
        format.json { render :show, status: :ok, location: @fonamentacio }
      else
        format.html { render :edit }
        format.json { render json: @fonamentacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fonamentacions/1
  # DELETE /fonamentacions/1.json
  def destroy
    @fonamentacio.destroy
    respond_to do |format|
      format.html { redirect_to fonamentacions_url, notice: 'Fonamentacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sistemes
      @edifici = Edifici.find(params[:edifici_id])
      @fonamentacio = Fonamentacio.find(@edifici.fonamentacio.id)
      @estructura = Estructura.find(@edifici.estructura.id)
      @tancaments_vertical = TancamentsVertical.find(@edifici.tancaments_vertical.id)
      @coberta = Coberta.find(@edifici.coberta.id)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fonamentacio_params
      params.require(:fonamentacio).permit(:edifici_id, :mur_pedra, :mur_fabrica_mao, :mur_fabrica_bloc, :mur_formigo_armat, :mur_pantalla, :sabates_paredat, :sabates_formigo, :llosa, :pilons, :pantalles)
    end
end
