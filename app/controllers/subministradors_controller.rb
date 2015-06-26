class SubministradorsController < ApplicationController
  before_action :set_subministrador, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_subministradors
  respond_to :html, :js

  def new
    @subministrador = Subministrador.new
  end

  def edit
  end

  def create
    @subministrador = Subministrador.create(subministrador_params)
  end

  def update
    @subministrador.update_attributes(subministrador_params)
  end

  def destroy
    @subministrador.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subministrador
      @subministrador = Subministrador.find(params[:id])
    end

    def all_subministradors
      @subministradors = Subministrador.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subministrador_params
      params.require(:subministrador).permit(:edifici_id, :nom_subministrador, :nif_subministrador, :adreca_subministrador, :cp_subministrador, :poblacio_subministrador, :provincia_subministrador, :pais_subministrador)
    end
end
