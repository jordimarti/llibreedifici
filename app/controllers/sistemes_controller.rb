class SistemesController < ApplicationController
  before_action :set_sistema, only: [:show, :edit, :update, :destroy]
  before_action :all_sistemes, only: [:index, :create, :update, :destroy, :afegir_sistema]
  before_action :set_edifici
  respond_to :html, :js
  layout 'edifici'

  # GET /sistemes
  # GET /sistemes.json
  def index
    #@sistemes = Sistema.all
    @submenu_actiu = 'sistemes'
    @fonamentacio = Fonamentacio.where(:edifici_id => params[:edifici_id]).last
    #@estructura = Estructura.where(:edifici_id => params[:edifici_id]).last
  end

  # GET /sistemes/1
  # GET /sistemes/1.json
  def show
  end

  # GET /sistemes/new
  def new
    @sistema = Sistema.new
  end

  # GET /sistemes/1/edit
  def edit
  end

  # POST /sistemes
  # POST /sistemes.json
  def create
    @sistema  = Sistema.create(sistema_params)
  end

  # PATCH/PUT /sistemes/1
  # PATCH/PUT /sistemes/1.json
  def update
    @sistema.update_attributes(sistema_params)
  end

  # DELETE /sistemes/1
  # DELETE /sistemes/1.json
  def destroy
    @sistema.destroy
  end

  def afegir_sistema
    @sistema = Sistema.new
    @sistema.nom_sistema = params[:nom_sistema]
    @sistema.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sistema
      @sistema = Sistema.find(params[:id])
    end

    def all_sistemes
      @sistemes = Sistema.all
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sistema_params
      params.require(:sistema).permit(:edifici_id, :nom_sistema, :pare_sistema)
    end
end
