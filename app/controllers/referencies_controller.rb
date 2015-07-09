class ReferenciesController < ApplicationController
  before_action :set_referencia, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_referencies
  respond_to :html, :js
  layout 'edifici'

  # GET /referencies
  # GET /referencies.json
  def index
    @submenu_actiu = 'operacions'
    @operacions = Operacio.all

    @operacions_fonamentacio = Operacio.where(:sistema => 'fonamentacio')
    @operacions_estructura = Operacio.where(:sistema => 'estructura')
  end

  #Aquest mètode consulta la definició de l'edifici i crea el llistat de referències a les operacions de manteniment
  def crear_llistat
    #Primer eliminem totes les referències abans de crear-les de nou, en cas que aquell edifici ja en tingui
    @referencies.each do |referencia|
      referencia.destroy
    end

    fonamentacio = Fonamentacio.where(:edifici_id => @edifici.id).last
    if (fonamentacio.mur_pedra == true || fonamentacio.mur_fabrica_mao == true || fonamentacio.mur_fabrica_bloc == true || fonamentacio.mur_formigo_armat || fonamentacio.mur_pantalla)
      crear_referencia(2)
      crear_referencia(3)
      crear_referencia(4)
      crear_referencia(5)
    end
    if (fonamentacio.sabates_paredat == true || fonamentacio.sabates_formigo == true || fonamentacio.llosa == true || fonamentacio.pilons == true || fonamentacio.pantalles == true) 
      crear_referencia(1)
    end

    estructura = Estructura.where(:edifici_id => @edifici.id).last
    if (estructura.parets_pedra == true)
      crear_referencia(7)
    end
    if (estructura.pilars_acer == true)
      crear_referencia(11)
      crear_referencia(12)
      crear_referencia(13)
      crear_referencia(14)
    end
    if (estructura.parets_formigo_armat == true || estructura.pilars_formigo_armat == true)
      crear_referencia(15)
      crear_referencia(16)
    end
    if (estructura.parets_fabrica_mao == true || estructura.parets_bloc_ceramic == true || estructura.parets_bloc_formigo == true || estructura.pilars_mao == true)
      crear_referencia(8)
    end
    if (estructura.parets_entramat_fusta == true)
      crear_referencia(17)
    end
    if (estructura.bigues_fusta == true || estructura.forjat_fusta == true)
      crear_referencia(20)
    end
    if (estructura.bigues_metaliques == true || estructura.forjat_metalic == true)
      crear_referencia(21)
      crear_referencia(22)
      crear_referencia(23)
    end
    if (estructura.bigues_formigo_armat == true || estructura.forjat_formigo_armat == true || estructura.forjat_reticular == true || estructura.llosa_formigo == true)
      crear_referencia(24)
      crear_referencia(25)
    end
    if (estructura.forjat_sanitari == true || estructura.solera == true)
      crear_referencia(6)
    end


    redirect_to action: "index"
  end

  def crear_referencia(operacio)
    referencia = Referencia.new
    referencia.operacio_id = operacio
    referencia.edifici_id = @edifici.id
    referencia.save
  end

  # GET /referencies/1
  # GET /referencies/1.json
  def show
  end

  # GET /referencies/new
  def new
    @referencia = Referencia.new
  end

  # GET /referencies/1/edit
  def edit
  end

  # POST /referencies
  # POST /referencies.json
  def create
    @referencia = Referencia.new(referencia_params)

    respond_to do |format|
      if @referencia.save
        format.html { redirect_to @referencia, notice: 'Referencia was successfully created.' }
        format.json { render :show, status: :created, location: @referencia }
      else
        format.html { render :new }
        format.json { render json: @referencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencies/1
  # PATCH/PUT /referencies/1.json
  def update
    respond_to do |format|
      if @referencia.update(referencia_params)
        format.html { redirect_to @referencia, notice: 'Referencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @referencia }
      else
        format.html { render :edit }
        format.json { render json: @referencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencies/1
  # DELETE /referencies/1.json
  def destroy
    @referencia.destroy
    respond_to do |format|
      format.html { redirect_to edifici_referencies_path, notice: 'Referencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia
      @referencia = Referencia.find(params[:id])
    end

    def all_referencies
      @referencies = Referencia.where(:edifici_id => params[:edifici_id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referencia_params
      params.require(:referencia).permit(:edifici_id, :operacio_id)
    end
end
