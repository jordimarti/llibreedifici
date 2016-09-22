class SignaturaInstruccionsController < ApplicationController
  before_action :set_signatura_instruccion, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_signatura_instruccions
  respond_to :html, :js

  # GET /signatura_instruccions
  # GET /signatura_instruccions.json
  def index
    @signatura_instruccions = SignaturaInstruccion.all
  end

  # GET /signatura_instruccions/1
  # GET /signatura_instruccions/1.json
  def show
  end

  # GET /signatura_instruccions/new
  def new
    @signatura_instruccion = SignaturaInstruccion.new
  end

  def edit
  end

  def create
    @signatura_instruccion = SignaturaInstruccion.create(signatura_instruccion_params)
  end

  def update
    @signatura_instruccion.update_attributes(signatura_instruccion_params)
  end

  def destroy
    @signatura_instruccion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signatura_instruccion
      @signatura_instruccion = SignaturaInstruccion.find(params[:id])
    end

    def all_signatura_instruccions
      @signatura_instruccions = SignaturaInstruccion.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signatura_instruccion_params
      params.require(:signatura_instruccion).permit(:edifici_id, :autor_instruccions_nom, :autor_instruccions_titulacio)
    end
end
