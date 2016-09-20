class SignaturaInstruccionsController < ApplicationController
  before_action :set_signatura_instruccion, only: [:show, :edit, :update, :destroy]

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

  # GET /signatura_instruccions/1/edit
  def edit
  end

  # POST /signatura_instruccions
  # POST /signatura_instruccions.json
  def create
    @signatura_instruccion = SignaturaInstruccion.new(signatura_instruccion_params)

    respond_to do |format|
      if @signatura_instruccion.save
        format.html { redirect_to @signatura_instruccion, notice: 'Signatura instruccion was successfully created.' }
        format.json { render :show, status: :created, location: @signatura_instruccion }
      else
        format.html { render :new }
        format.json { render json: @signatura_instruccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signatura_instruccions/1
  # PATCH/PUT /signatura_instruccions/1.json
  def update
    respond_to do |format|
      if @signatura_instruccion.update(signatura_instruccion_params)
        format.html { redirect_to @signatura_instruccion, notice: 'Signatura instruccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @signatura_instruccion }
      else
        format.html { render :edit }
        format.json { render json: @signatura_instruccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signatura_instruccions/1
  # DELETE /signatura_instruccions/1.json
  def destroy
    @signatura_instruccion.destroy
    respond_to do |format|
      format.html { redirect_to signatura_instruccions_url, notice: 'Signatura instruccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signatura_instruccion
      @signatura_instruccion = SignaturaInstruccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signatura_instruccion_params
      params.require(:signatura_instruccion).permit(:edifici_id, :autor_instruccions_nom, :autor_instruccions_titulacio)
    end
end
