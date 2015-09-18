class ColaboradorsController < ApplicationController
  before_action :set_colaborador, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_colaboradors
  respond_to :html, :js

  def new
    @colaborador = Colaborador.new
  end

  def edit
  end

  def create
    @colaborador = Colaborador.create(colaborador_params)
  end

  def update
    @colaborador.update_attributes(colaborador_params)
  end

  def destroy
    @colaborador.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborador
      @colaborador = Colaborador.find(params[:id])
    end

    def all_colaboradors
      @colaboradors = Colaborador.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colaborador_params
      params.require(:colaborador).permit(:edifici_id, :nom_colaborador, :titulacio_colaborador, :rao_social_colaborador, :nif_colaborador, :ambit_colaboracio, :telefon, :email, :web)
    end
end
