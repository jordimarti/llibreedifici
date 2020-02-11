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
    
    # Copiem la descripció del català al castellà o a la inversa, per tal que aparegui descripció encara que es canviï d'idioma
    if @operacio.descripcio_ca.blank?
      @operacio.descripcio_ca = @operacio.descripcio_es
    end
    if @operacio.periodicitat_text_ca.blank?
      @operacio.periodicitat_text_ca = @operacio.periodicitat_text_es
    end
    if @operacio.responsable_ca.blank?
      @operacio.responsable_ca = @operacio.responsable_es
    end

    if @operacio.descripcio_es.blank?
      @operacio.descripcio_es = @operacio.descripcio_ca
    end
    if @operacio.periodicitat_text_es.blank?
      @operacio.periodicitat_text_es = @operacio.periodicitat_text_ca
    end
    if @operacio.responsable_es.blank?
      @operacio.responsable_es = @operacio.responsable_ca
    end

    respond_to do |format|
      if @operacio.save
        #Després de crear una operació hem de crear la referència per a que li aparegui a l'usuari en l'edifici que toqui
        referencia = Referencia.new
        referencia.edifici_id = referencia_params[:edifici_id]
        referencia.operacio_id = @operacio.id
        referencia.sistema = @operacio.sistema
        if comprovacio_operacio_manual_usuari(@operacio) == true
          referencia.manual_habitatge = true
        end
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

  # Comprovem si l'operació creada per l'usuari fa referència a l'usuari de l'edifici i per tant ha d'aparèixer al manual de l'habitatge
  def comprovacio_operacio_manual_usuari(operacio)
    if operacio.responsable_ca == "usuari" || operacio.responsable_ca == "Usuari" || operacio.responsable_ca == "USUARI" || operacio.responsable_es == "usuario" || operacio.responsable_es == "Usuario" || operacio.responsable_es == "USUARIO"
      return true
    else
      return false
    end
  end

  # PATCH/PUT /operacions/1
  # PATCH/PUT /operacions/1.json
  def update
    respond_to do |format|
      if @operacio.update(operacio_params)
        referencia = Referencia.where(operacio_id: @operacio.id).last
        edifici_id = referencia.edifici_id
        format.html { redirect_to edifici_referencies_path(:edifici_id => edifici_id) }
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
