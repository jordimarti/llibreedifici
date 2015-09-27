class ElectricitatsController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /electricitats
  # GET /electricitats.json
  def index
    @electricitats = Electricitat.all
  end

  # GET /electricitats/1
  # GET /electricitats/1.json
  def show
  end

  # GET /electricitats/new
  def new
    @electricitat = Electricitat.new
  end

  # GET /electricitats/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.electricitat.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'electricitat'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'electricitat')
  end

  # POST /electricitats
  # POST /electricitats.json
  def create
    @electricitat = Electricitat.new(electricitat_params)

    respond_to do |format|
      if @electricitat.save
        format.html { redirect_to @electricitat, notice: 'Electricitat was successfully created.' }
        format.json { render :show, status: :created, location: @electricitat }
      else
        format.html { render :new }
        format.json { render json: @electricitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electricitats/1
  # PATCH/PUT /electricitats/1.json
  def update
    respond_to do |format|
      if @electricitat.update(electricitat_params)
        format.html { redirect_to edit_edifici_electricitat_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @electricitat }
      else
        format.html { render :edit }
        format.json { render json: @electricitat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electricitats/1
  # DELETE /electricitats/1.json
  def destroy
    @electricitat.destroy
    respond_to do |format|
      format.html { redirect_to electricitats_url, notice: 'Electricitat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electricitat
      @electricitat = Electricitat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def electricitat_params
      params.require(:electricitat).permit(:edifici_id, :enllumenat_comunitari, :mes_100k, :connexio_terra, :centre_transformacio, :fotovoltaica, :comptador_unic, :comptadors_individuals_habitatge, :comptadors_centralitzats)
    end
end
