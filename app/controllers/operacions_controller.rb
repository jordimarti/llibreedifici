class OperacionsController < ApplicationController
  before_action :set_operacio, only: [:show, :edit, :update, :destroy]
  before_action :all_operacions
  respond_to :html, :js
  layout 'application'

  # GET /operacions
  # GET /operacions.json
  def index
    
  end

  

  # GET /operacions/1
  # GET /operacions/1.json
  def show
  end

  # GET /operacions/new
  def new
    @operacio = Operacio.new
  end

  # GET /operacions/1/edit
  def edit
  end

  # POST /operacions
  # POST /operacions.json
  def create
    @operacio = Operacio.new(operacio_params)
    last_operacio = Operacio.last
    @operacio.id = last_operacio.id + 1

    respond_to do |format|
      if @operacio.save
        #Després de crear una operació hem de crear la referència per a que li aparegui a l'usuari en l'edifici que toqui
        referencia = Referencia.new
        referencia.edifici_id = referencia_params[:edifici_id]
        referencia.operacio_id = @operacio.id
        referencia.sistema = @operacio.sistema
        referencia.creat_usuari = true
        referencia.save

        format.html { redirect_to edifici_referencies_path(:edifici_id => referencia_params[:edifici_id]) }
        format.json { render :show, status: :created, location: @operacio }
      else
        format.html { render :new }
        format.json { render json: @operacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operacions/1
  # PATCH/PUT /operacions/1.json
  def update
    respond_to do |format|
      if @operacio.update(operacio_params)
        format.html { redirect_to @operacio, notice: 'Operacio was successfully updated.' }
        format.json { render :show, status: :ok, location: @operacio }
      else
        format.html { render :edit }
        format.json { render json: @operacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operacions/1
  # DELETE /operacions/1.json
  def destroy
    @operacio.destroy
    respond_to do |format|
      format.html { redirect_to operacions_url, notice: 'Operacio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operacio
      @operacio = Operacio.find(params[:id])
    end

    def all_operacions
      @operacions = Operacio.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operacio_params
      params.require(:operacio).permit(:descripcio_ca, :descripcio_es, :periodicitat, :periodicitat_text_ca, :periodicitat_text_es, :document_referencia, :responsable_ca, :responsable_es, :obligatorietat, :creat_usuari, :sistema)
    end

    def referencia_params
      params.require(:operacio).permit(:edifici_id)
    end
end
