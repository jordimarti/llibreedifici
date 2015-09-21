class DadesController < ApplicationController
  include CheckUser
  before_action :set_edifici
  layout 'edifici'

  def index
    check_user_edifici
  	@submenu_actiu = 'dades'
  	@llicencies = Llicencia.where(:edifici_id => params[:edifici_id])
    @declaracions = Declaracio.where(:edifici_id => params[:edifici_id])
    @regim_propietats = RegimPropietat.where(:edifici_id => params[:edifici_id])
    @regim_especials = RegimEspecial.where(:edifici_id => params[:edifici_id])
    @carregues = Carrega.where(:edifici_id => params[:edifici_id])
    @entitats = Entitat.where(:edifici_id => params[:edifici_id])
    @garantia_promotors = GarantiaPromotor.where(:edifici_id => params[:edifici_id])
    @garantia_instalacions = GarantiaInstalacio.where(:edifici_id => params[:edifici_id])
    @garantia_constructors = GarantiaConstructor.where(:edifici_id => params[:edifici_id])
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
end
