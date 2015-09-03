class EntitatsController < ApplicationController
  before_action :set_entitat, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_entitats
  respond_to :html, :js

  def new
    @entitat = Entitat.new
  end

  def edit
  end

  def create
    @entitat = Entitat.create(entitat_params)
  end

  def update
    @entitat.update_attributes(entitat_params)
  end

  def destroy
    @entitat.destroy
  end

  private
    def set_entitat
      @entitat = Entitat.find(params[:id])
    end

    def all_entitats
      @entitats = Entitat.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entitat_params
      params.require(:entitat).permit(:edifici_id, :nom_entitat, :superficie, :destinacio, :quota)
    end
end
