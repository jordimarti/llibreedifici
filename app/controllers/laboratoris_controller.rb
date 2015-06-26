class LaboratorisController < ApplicationController
  before_action :set_laboratori, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_laboratoris
  respond_to :html, :js

  def new
    @laboratori = Laboratori.new
  end

  def edit
  end

  def create
    @laboratori = Laboratori.create(laboratori_params)
  end

  def update
    @laboratori.update_attributes(laboratori_params)
  end

  def destroy
    @laboratori.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratori
      @laboratori = Laboratori.find(params[:id])
    end

    def all_laboratoris
      @laboratoris = Laboratori.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laboratori_params
      params.require(:laboratori).permit(:edifici_id, :nom_laboratori, :nif_laboratori)
    end
end
