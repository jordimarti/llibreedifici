class IncendisController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /incendis
  # GET /incendis.json
  def index
    @incendis = Incendi.all
  end

  # GET /incendis/1
  # GET /incendis/1.json
  def show
  end

  # GET /incendis/new
  def new
    @incendi = Incendi.new
  end

  # GET /incendis/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.incendi.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'incendis'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'incendis')
  end

  # POST /incendis
  # POST /incendis.json
  def create
    @incendi = Incendi.new(incendi_params)

    respond_to do |format|
      if @incendi.save
        format.html { redirect_to @incendi, notice: 'Incendi was successfully created.' }
        format.json { render :show, status: :created, location: @incendi }
      else
        format.html { render :new }
        format.json { render json: @incendi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incendis/1
  # PATCH/PUT /incendis/1.json
  def update
    respond_to do |format|
      if @incendi.update(incendi_params)
        format.html { redirect_to edit_edifici_incendi_path }
        format.json { render :show, status: :ok, location: @incendi }
      else
        format.html { render :edit }
        format.json { render json: @incendi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incendis/1
  # DELETE /incendis/1.json
  def destroy
    @incendi.destroy
    respond_to do |format|
      format.html { redirect_to incendis_url, notice: 'Incendi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incendi
      @incendi = Incendi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incendi_params
      params.require(:incendi).permit(:edifici_id, :alarma_automatica, :alarma_manual, :extintors, :abastiment_aigua, :bie, :hidrants, :ruixadors, :columnes_seques, :parallamps)
    end
end
