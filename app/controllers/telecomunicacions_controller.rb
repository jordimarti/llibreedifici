class TelecomunicacionsController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /telecomunicacions
  # GET /telecomunicacions.json
  def index
    @telecomunicacions = Telecomunicacio.all
  end

  # GET /telecomunicacions/1
  # GET /telecomunicacions/1.json
  def show
  end

  # GET /telecomunicacions/new
  def new
    @telecomunicacio = Telecomunicacio.new
  end

  # GET /telecomunicacions/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.telecomunicacio.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'telecomunicacions'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'telecomunicacions')
  end

  # POST /telecomunicacions
  # POST /telecomunicacions.json
  def create
    @telecomunicacio = Telecomunicacio.new(telecomunicacio_params)

    respond_to do |format|
      if @telecomunicacio.save
        format.html { redirect_to @telecomunicacio, notice: 'Telecomunicacio was successfully created.' }
        format.json { render :show, status: :created, location: @telecomunicacio }
      else
        format.html { render :new }
        format.json { render json: @telecomunicacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telecomunicacions/1
  # PATCH/PUT /telecomunicacions/1.json
  def update
    respond_to do |format|
      if @telecomunicacio.update(telecomunicacio_params)
        format.html { redirect_to edit_edifici_telecomunicacio_path }
        format.json { render :show, status: :ok, location: @telecomunicacio }
      else
        format.html { render :edit }
        format.json { render json: @telecomunicacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telecomunicacions/1
  # DELETE /telecomunicacions/1.json
  def destroy
    @telecomunicacio.destroy
    respond_to do |format|
      format.html { redirect_to telecomunicacions_url, notice: 'Telecomunicacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telecomunicacio
      @telecomunicacio = Telecomunicacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def telecomunicacio_params
      params.require(:telecomunicacio).permit(:edifici_id, :porter_audio, :porter_video, :antena_individual, :antena_colectiva, :parabolica_individual, :parabolica_colectiva, :telefonia, :riti, :rits, :ritu, :ritm)
    end
end
