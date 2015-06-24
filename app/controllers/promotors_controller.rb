class PromotorsController < ApplicationController
  before_action :set_promotor, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_promotors
  respond_to :html, :js

  def new
    @promotor = Promotor.new
  end

  def edit
  end

  def create
    @promotor = Promotor.create(promotor_params)
  end

  def update
    @promotor.update_attributes(promotor_params)
  end

  def destroy
    @promotor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotor
      @promotor = Promotor.find(params[:id])
    end

    def all_promotors
      @promotors = Promotor.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotor_params
      params.require(:promotor).permit(:edifici_id, :nom_promotor, :nif_promotor, :adreca_promotor, :cp_promotor, :poblacio_promotor, :provincia_promotor, :pais_promotor)
    end
end
