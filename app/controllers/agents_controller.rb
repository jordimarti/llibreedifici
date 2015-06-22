class AgentsController < ApplicationController
  before_action :set_edifici

  def index
  end

  private
  
    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

end
