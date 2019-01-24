class InscripcioRegistralsController < ApplicationController
  before_action :set_inscripcio_registral, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_inscripcio_registrals
  respond_to :html, :js

  def new
    @inscripcio_registral = InscripcioRegistral.new
  end

  def edit
  end

  def create
    @inscripcio_registral = InscripcioRegistral.create(inscripcio_registral_params)
  end

  def update
    @inscripcio_registral.update_attributes(inscripcio_registral_params)
  end

  def destroy
    @inscripcio_registral.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscripcio_registral
      @inscripcio_registral = InscripcioRegistral.find(params[:id])
    end

    def all_inscripcio_registrals
      @inscripcio_registrals = InscripcioRegistral.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscripcio_registral_params
      params.require(:inscripcio_registral).permit(:edifici_id, :data, :tom, :foli, :llibre, :numero_finca, :registre)
    end
end
