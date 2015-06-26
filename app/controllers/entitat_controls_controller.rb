class EntitatControlsController < ApplicationController
  before_action :set_entitat_control, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_entitat_controls
  respond_to :html, :js

  def new
    @entitat_control = EntitatControl.new
  end

  def edit
  end

  def create
    @entitat_control = EntitatControl.create(entitat_control_params)
  end

  def update
    @entitat_control.update_attributes(entitat_control_params)
  end

  def destroy
    @entitat_control.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entitat_control
      @entitat_control = EntitatControl.find(params[:id])
    end

    def all_entitat_controls
      @entitat_controls = EntitatControl.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entitat_control_params
      params.require(:entitat_control).permit(:edifici_id, :nom_entitat_control, :nif_entitat_control, :adreca_entitat_control, :cp_entitat_control, :poblacio_entitat_control, :provincia_entitat_control, :pais_entitat_control)
    end
end
