class AgentsController < ApplicationController
  before_action :set_edifici
  layout 'identificacio'

  def index
  	@submenu_actiu = 'agents'
  	@promotor = Promotor.new
  	@promotors = Promotor.where(:edifici_id => params[:edifici_id])
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

end
