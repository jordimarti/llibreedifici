class ProjectistesController < ApplicationController
  before_action :set_projectista, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_projectistes
  respond_to :html, :js

  def new
    @projectista = Projectista.new
  end

  def edit
  end

  def create
    @projectista = Projectista.create(projectista_params)
  end

  def update
    @projectista.update_attributes(projectista_params)
  end

  def destroy
    @projectista.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projectista
      @projectista = Projectista.find(params[:id])
    end

    def all_projectistes
      @projectistes = Projectista.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectista_params
      params.require(:projectista).permit(:edifici_id, :nom_projectista, :titulacio_projectista, :rao_social_projectista, :nif_projectista)
    end
end
