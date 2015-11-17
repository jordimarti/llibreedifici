class IitesController < ApplicationController
  before_action :set_iite, only: [:show, :edit, :update, :destroy]
  before_action :set_iite, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_iites
  respond_to :html, :js

  def new
    @iite = Iite.new
  end

  def edit
  end

  def create
    @iite = Iite.create(iite_params)
  end

  def update
    @iite.update_attributes(iite_params)
  end

  def destroy
    @iite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iite
      @iite = Iite.find(params[:id])
    end

    def all_iites
      @iites = Iite.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iite_params
      params.require(:iite).permit(:edifici_id, :referencia, :data)
    end
end
