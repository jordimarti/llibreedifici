class CoordinadorsController < ApplicationController
  before_action :set_coordinador, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_coordinadors
  respond_to :html, :js

  def new
    @coordinador = Coordinador.new
  end

  def edit
  end

  def create
    @coordinador = Coordinador.create(coordinador_params)
  end

  def update
    @coordinador.update_attributes(coordinador_params)
  end

  def destroy
    @coordinador.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinador
      @coordinador = Coordinador.find(params[:id])
    end

    def all_coordinadors
      @coordinadors = Coordinador.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinador_params
      params.require(:coordinador).permit(:edifici_id, :nom_coordinador, :titulacio_coordinador, :rao_social_coordinador, :nif_coordinador, :telefon, :email, :web)
    end
end
