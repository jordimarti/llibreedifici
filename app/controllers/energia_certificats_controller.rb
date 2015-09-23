class EnergiaCertificatsController < ApplicationController
  before_action :set_energia_certificat, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_energia_certificats
  respond_to :html, :js

  def new
    @energia_certificat = EnergiaCertificat.new
  end

  def edit
  end

  def create
    @energia_certificat = EnergiaCertificat.create(energia_certificat_params)
  end

  def update
    @energia_certificat.update_attributes(energia_certificat_params)
  end

  def destroy
    @energia_certificat.destroy
  end

  private
    def set_energia_certificat
      @energia_certificat = EnergiaCertificat.find(params[:id])
    end

    def all_energia_certificats
      @energia_certificats = EnergiaCertificat.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def energia_certificat_params
      params.require(:energia_certificat).permit(:edifici_id, :numero_registre, :vigencia, :qualificacio_energetica, :consum_energia_primaria, :emissions_co2)
    end
end
