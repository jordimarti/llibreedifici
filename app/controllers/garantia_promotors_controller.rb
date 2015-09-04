class GarantiaPromotorsController < ApplicationController
  before_action :set_garantia_promotor, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_garantia_promotors
  respond_to :html, :js

  def new
    @garantia_promotor = GarantiaPromotor.new
  end

  def edit
  end

  def create
    @garantia_promotor = GarantiaPromotor.create(garantia_promotor_params)
  end

  def update
    @garantia_promotor.update_attributes(garantia_promotor_params)
  end

  def destroy
    @garantia_promotor.destroy
  end

  private
    def set_garantia_promotor
      @garantia_promotor = GarantiaPromotor.find(params[:id])
    end

    def all_garantia_promotors
      @garantia_promotors = GarantiaPromotor.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garantia_promotor_params
      params.require(:garantia_promotor).permit(:edifici_id, :venciment, :tipus, :referencia)
    end
end
