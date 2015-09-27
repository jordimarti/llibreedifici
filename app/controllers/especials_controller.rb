class EspecialsController < ApplicationController
  include CheckUser
  include SetSistemes
  before_action :set_sistemes, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /especials
  # GET /especials.json
  def index
    @especials = Especial.all
  end

  # GET /especials/1
  # GET /especials/1.json
  def show
  end

  # GET /especials/new
  def new
    @especial = Especial.new
  end

  # GET /especials/1/edit
  def edit
    # Comprovació edifici pertany a usuari
    check_user_edifici
    # Comprovació pàgina correspon a edifici
    if @edifici.especial.id != params[:id].to_i
      redirect_to home_permisos_path
    end

    @submenu_actiu = 'sistemes'
    @menu_sistemes_actiu = 'especials'
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => 'especials')
  end

  # POST /especials
  # POST /especials.json
  def create
    @especial = Especial.new(especial_params)

    respond_to do |format|
      if @especial.save
        format.html { redirect_to @especial, notice: 'Especial was successfully created.' }
        format.json { render :show, status: :created, location: @especial }
      else
        format.html { render :new }
        format.json { render json: @especial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especials/1
  # PATCH/PUT /especials/1.json
  def update
    respond_to do |format|
      if @especial.update(especial_params)
        format.html { redirect_to edit_edifici_especial_path, notice: t('.guardat_ok') }
        format.json { render :show, status: :ok, location: @especial }
      else
        format.html { render :edit }
        format.json { render json: @especial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especials/1
  # DELETE /especials/1.json
  def destroy
    @especial.destroy
    respond_to do |format|
      format.html { redirect_to especials_url, notice: 'Especial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especial
      @especial = Especial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especial_params
      params.require(:especial).permit(:edifici_id, :piscina_estructura_obra, :piscina_estructura_composite, :piscina_estructura_acer, :piscina_vores_formigo, :piscina_vores_pedra, :piscina_ceramica, :piscina_resines, :piscina_porcellana, :piscina_climatitzacio, :piscina_iluminacio, :piscina_purificador)
    end
end
