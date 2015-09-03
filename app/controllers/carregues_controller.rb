class CarreguesController < ApplicationController
  before_action :set_carrega, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_carregues
  respond_to :html, :js

  def new
    @carrega = Carrega.new
  end

  def edit
  end

  def create
    @carrega = Carrega.create(carrega_params)
  end

  def update
    @carrega.update_attributes(carrega_params)
  end

  def destroy
    @carrega.destroy
  end

  private
    def set_carrega
      @carrega = Carrega.find(params[:id])
    end

    def all_carregues
      @carregues = Carrega.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrega_params
      params.require(:carrega).permit(:edifici_id, :tipus_carrega, :document_carrega)
    end
end
