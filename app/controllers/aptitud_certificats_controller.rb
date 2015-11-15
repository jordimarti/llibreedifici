class AptitudCertificatsController < ApplicationController
  before_action :set_aptitud_certificat, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_aptitud_certificats
  respond_to :html, :js

  def new
    @aptitud_certificat = AptitudCertificat.new
  end

  def edit
  end

  def create
    @aptitud_certificat = AptitudCertificat.create(aptitud_certificat_params)
  end

  def update
    @aptitud_certificat.update_attributes(aptitud_certificat_params)
  end

  def destroy
    @aptitud_certificat.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aptitud_certificat
      @aptitud_certificat = AptitudCertificat.find(params[:id])
    end

    def all_aptitud_certificats
      @aptitud_certificats = AptitudCertificat.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aptitud_certificat_params
      params.require(:aptitud_certificat).permit(:edifici_id, :numero_expedient, :codi_informe, :data_ite, :certificat_aptitud, :data_programa, :necessitat_verificacions_tecniques, :periodicitat_verificacions_tecniques)
    end
end
