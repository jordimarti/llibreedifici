class IndustrialsController < ApplicationController
  before_action :set_industrial, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_industrials
  respond_to :html, :js

  def new
    @industrial = Industrial.new
  end

  def edit
  end

  def create
    @industrial = Industrial.create(industrial_params)
  end

  def update
    @industrial.update_attributes(industrial_params)
  end

  def destroy
    @industrial.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrial
      @industrial = Industrial.find(params[:id])
    end

    def all_industrials
      @industrials = Industrial.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrial_params
      params.require(:industrial).permit(:edifici_id, :nom_industrial, :nif_industrial, :adreca_industrial, :cp_industrial, :poblacio_industrial, :provincia_industrial, :pais_industrial, :servei_obra, :telefon, :email, :web)
    end
end
