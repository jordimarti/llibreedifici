class SignaturaLlibresController < ApplicationController
  before_action :set_signatura_llibre, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_signatura_llibres
  respond_to :html, :js

  # GET /signatura_llibres
  # GET /signatura_llibres.json
  def index
    @signatura_llibres = SignaturaLlibre.all
  end

  # GET /signatura_llibres/1
  # GET /signatura_llibres/1.json
  def show
  end

  # GET /signatura_llibres/new
  def new
    @signatura_llibre = SignaturaLlibre.new
  end

  def edit
  end

  def create
    @signatura_llibre = SignaturaLlibre.create(signatura_llibre_params)
  end

  def update
    @signatura_llibre.update_attributes(signatura_llibre_params)
  end

  def destroy
    @signatura_llibre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signatura_llibre
      @signatura_llibre = SignaturaLlibre.find(params[:id])
    end

    def all_signatura_llibres
      @signatura_llibres = SignaturaLlibre.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signatura_llibre_params
      params.require(:signatura_llibre).permit(:edifici_id, :autor_llibre_nom, :autor_llibre_titulacio)
    end
end
