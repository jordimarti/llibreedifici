class SignaturaPromotorsController < ApplicationController
  before_action :set_signatura_promotor, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_signatura_promotors
  respond_to :html, :js

  # GET /signatura_promotors
  # GET /signatura_promotors.json
  def index
    @signatura_promotors = SignaturaPromotor.all
  end

  # GET /signatura_promotors/1
  # GET /signatura_promotors/1.json
  def show
  end

  # GET /signatura_promotors/new
  def new
    @signatura_promotor = SignaturaPromotor.new
  end

  def edit
  end

  def create
    @signatura_promotor = SignaturaPromotor.create(signatura_promotor_params)
  end

  def update
    @signatura_promotor.update_attributes(signatura_promotor_params)
  end

  def destroy
    @signatura_promotor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signatura_promotor
      @signatura_promotor = SignaturaPromotor.find(params[:id])
    end

    def all_signatura_promotors
      @signatura_promotors = SignaturaPromotor.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signatura_promotor_params
      params.require(:signatura_promotor).permit(:edifici_id, :promotor_rao_social, :promotor_nom_representant)
    end
end
