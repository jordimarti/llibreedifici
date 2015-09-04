class GarantiaInstalacionsController < ApplicationController
  before_action :set_garantia_instalacio, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_garantia_instalacions
  respond_to :html, :js

  def new
    @garantia_instalacio = GarantiaInstalacio.new
  end

  def edit
  end

  def create
    @garantia_instalacio = GarantiaInstalacio.create(garantia_instalacio_params)
  end

  def update
    @garantia_instalacio.update_attributes(garantia_instalacio_params)
  end

  def destroy
    @garantia_instalacio.destroy
  end

  private
    def set_garantia_instalacio
      @garantia_instalacio = GarantiaInstalacio.find(params[:id])
    end

    def all_garantia_instalacions
      @garantia_instalacions = GarantiaInstalacio.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def garantia_instalacio_params
      params.require(:garantia_instalacio).permit(:edifici_id, :venciment, :tipus, :instalacio, :empresa)
    end
end
