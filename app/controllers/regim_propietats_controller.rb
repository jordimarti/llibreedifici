class RegimPropietatsController < ApplicationController
  before_action :set_regim_propietat, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_regim_propietats
  respond_to :html, :js

  def new
    @regim_propietat = RegimPropietat.new
  end

  def edit
  end

  def create
    @regim_propietat = RegimPropietat.create(regim_propietat_params)
  end

  def update
    @regim_propietat.update_attributes(regim_propietat_params)
  end

  def destroy
    @regim_propietat.destroy
  end

  private
    def set_regim_propietat
      @regim_propietat = RegimPropietat.find(params[:id])
    end

    def all_regim_propietats
      @regim_propietats = RegimPropietat.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regim_propietat_params
      params.require(:regim_propietat).permit(:edifici_id, :tipus_regim_propietat, :document_escriptura)
    end
end
