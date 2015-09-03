class LlicenciesController < ApplicationController
  before_action :set_llicencia, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_llicencies
  respond_to :html, :js

  def new
    @llicencia = Llicencia.new
  end

  def edit
  end

  def create
    @llicencia = Llicencia.create(llicencia_params)
  end

  def update
    @llicencia.update_attributes(llicencia_params)
  end

  def destroy
    @llicencia.destroy
  end

  private
    def set_llicencia
      @llicencia = Llicencia.find(params[:id])
    end

    def all_llicencies
      @llicencies = Llicencia.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def llicencia_params
      params.require(:llicencia).permit(:edifici_id, :classe, :data_llicencia)
    end

end
