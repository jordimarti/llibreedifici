class DadesController < ApplicationController
  include CheckUser
  before_action :set_edifici
  layout 'edifici'

  def index
    check_user_edifici
  	@submenu_actiu = 'dades'
  	
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
end
