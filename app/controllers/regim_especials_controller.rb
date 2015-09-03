class RegimEspecialsController < ApplicationController
  before_action :set_regim_especial, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_regim_especials
  respond_to :html, :js

  def new
    @regim_especial = RegimEspecial.new
  end

  def edit
  end

  def create
    @regim_especial = RegimEspecial.create(regim_especial_params)
  end

  def update
    @regim_especial.update_attributes(regim_especial_params)
  end

  def destroy
    @regim_especial.destroy
  end

  private
    def set_regim_especial
      @regim_especial = RegimEspecial.find(params[:id])
    end

    def all_regim_especials
      @regim_especials = RegimEspecial.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regim_especial_params
      params.require(:regim_especial).permit(:edifici_id, :tipus_regim_especial, :referencia_document)
    end
end
