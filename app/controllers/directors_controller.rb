class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_directors
  respond_to :html, :js

  def new
    @director = Director.new
  end

  def edit
  end

  def create
    @director = Director.create(director_params)
  end

  def update
    @director.update_attributes(director_params)
  end

  def destroy
    @director.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_director
      @director = Director.find(params[:id])
    end

    def all_directors
      @directors = Director.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def director_params
      params.require(:director).permit(:edifici_id, :nom_director, :titulacio_director, :rao_social_director, :nif_director)
    end
end
