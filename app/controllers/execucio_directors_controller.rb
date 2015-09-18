class ExecucioDirectorsController < ApplicationController
  before_action :set_execucio_director, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_execucio_directors
  respond_to :html, :js

  def new
    @execucio_director = ExecucioDirector.new
  end

  def edit
  end

  def create
    @execucio_director = ExecucioDirector.create(execucio_director_params)
  end

  def update
    @execucio_director.update_attributes(execucio_director_params)
  end

  def destroy
    @execucio_director.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_execucio_director
      @execucio_director = ExecucioDirector.find(params[:id])
    end

    def all_execucio_directors
      @execucio_directors = ExecucioDirector.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def execucio_director_params
      params.require(:execucio_director).permit(:edifici_id, :nom_director_execucio, :titulacio_director_execucio, :rao_social_director_execucio, :nif_director_execucio, :telefon, :email, :web)
    end
end
