class DeclaracionsController < ApplicationController
  before_action :set_declaracio, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_declaracions
  respond_to :html, :js

  def new
    @declaracio = Declaracio.new
  end

  def edit
  end

  def create
    @declaracio = Declaracio.create(declaracio_params)
  end

  def update
    @declaracio.update_attributes(declaracio_params)
  end

  def destroy
    @declaracio.destroy
  end

  private
    def set_declaracio
      @declaracio = Declaracio.find(params[:id])
    end

    def all_declaracions
      @declaracions = Declaracio.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def declaracio_params
      params.require(:declaracio).permit(:edifici_id, :notari, :n_protocol, :data_declaracio)
    end
end
