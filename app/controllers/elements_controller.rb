class ElementsController < ApplicationController
  before_action :set_edifici
  layout 'elements'

  def index
  	@submenu_actiu = 'elements'
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

end
