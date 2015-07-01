class ReferenciesController < ApplicationController
  before_action :set_referencia, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_referencies
  respond_to :html, :js
  layout 'edifici'

  # GET /referencies
  # GET /referencies.json
  def index
    @operacions = Operacio.all
    @submenu_actiu = 'operacions'
  end

  #Aquest mètode consulta la definició de l'edifici i crea el llistat de referències a les operacions de manteniment
  def crear_llistat
    #Primer eliminem totes les referències abans de crear-les de nou, en cas que aquell edifici ja en tingui
    @referencies.each do |referencia|
      referencia.destroy
    end
    fonamentacio = Fonamentacio.where(:edifici_id => @edifici.id).last
    if (fonamentacio.mur_pedra == true)
      crear_referencia(1)
    end
    if (fonamentacio.mur_formigo_armat == true)
      crear_referencia(2)
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
      format.html { redirect_to referencies_url, notice: 'Referencia was successfully destroyed.' }
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
