class EdificisController < ApplicationController
  before_action :set_edifici, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  #layout 'edifici', only: [:quadern_nou_plurifamiliar]

  # GET /edificis
  # GET /edificis.json
  def index
    @edificis = Edifici.where(user_id: current_user.id)
  end

  # GET /edificis/1
  # GET /edificis/1.json
  def show
  end

  # GET /edificis/new
  def new
    @edifici = Edifici.new
    #@promotor = Promotor.new
    @current_user_id = current_user.id
  end

  # GET /edificis/1/edit
  def edit
  end

  # POST /edificis
  # POST /edificis.json
  def create
    @edifici = Edifici.new(edifici_params)
    respond_to do |format|
      if @edifici.save
        #Aquí creem els objectes complementaris a l'edifici (dades_edifici, checklist...)
        create_complements(@edifici.id)

        format.html { redirect_to @edifici, notice: 'Edifici was successfully created.' }
        format.json { render :show, status: :created, location: @edifici }
      else
        format.html { render :new }
        format.json { render json: @edifici.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_complements(edifici_id)
    #Identificacio
    @identificacio = Identificacio.new
    @identificacio.edifici_id = edifici_id
    @identificacio.save
    #Fonamentacio
    @fonamentacio = Fonamentacio.new
    @fonamentacio.edifici_id = edifici_id
    @fonamentacio.save
    #Estructura
    @estructura = Estructura.new
    @estructura.edifici_id = edifici_id
    @estructura.save
    
  end

  #def quadern_nou_plurifamiliar
   # @menu_actiu = 'quadern'
    #@edifici = Edifici.find(params[:id])
    #@dades_edifici = DadesEdificiNou.where(:edifici_id => @edifici.id).last
    #if @edifici.user_id != current_user.id
      #redirect_to controller: "home", action: "permisos"
    #end
  #end

  # PATCH/PUT /edificis/1
  # PATCH/PUT /edificis/1.json
  def update
    respond_to do |format|
      if @edifici.update(edifici_params)
        format.html { redirect_to @edifici, notice: 'Edifici was successfully updated.' }
        format.json { render :show, status: :ok, location: @edifici }
      else
        format.html { render :edit }
        format.json { render json: @edifici.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edificis/1
  # DELETE /edificis/1.json
  def destroy
    @edifici.destroy
    respond_to do |format|
      format.html { redirect_to edificis_url, notice: 'Edifici was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edifici
      @edifici = Edifici.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edifici_params
      params.require(:edifici).permit(:user_id, :nom_edifici, :tipus_edifici)
    end
end
