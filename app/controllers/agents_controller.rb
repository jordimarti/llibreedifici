class AgentsController < ApplicationController
  include CheckUser
  before_action :set_edifici
  layout 'edifici'

  def index
    check_user_edifici
  	@submenu_actiu = 'agents'
  	@promotors = Promotor.where(:edifici_id => params[:edifici_id])
    @projectistes = Projectista.where(:edifici_id => params[:edifici_id])
    @constructors = Constructor.where(:edifici_id => params[:edifici_id])
    @directors = Director.where(:edifici_id => params[:edifici_id])
    @execucio_directors = ExecucioDirector.where(:edifici_id => params[:edifici_id])
    @laboratoris = Laboratori.where(:edifici_id => params[:edifici_id])
    @entitat_controls = EntitatControl.where(:edifici_id => params[:edifici_id])
    @subministradors = Subministrador.where(:edifici_id => params[:edifici_id])
    @industrials = Industrial.where(:edifici_id => params[:edifici_id])
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

end
