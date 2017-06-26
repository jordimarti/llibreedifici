class EdificisController < ApplicationController
  before_action :set_edifici, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /edificis
  # GET /edificis.json
  def index
    @edificis = Edifici.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /edificis/1
  # GET /edificis/1.json
  def show
  end

  # GET /edificis/new
  def new
    @edifici = Edifici.new
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

        format.html { redirect_to validar_dades_path(@edifici.id) }
        format.json { render :show, status: :created, location: @edifici }
      else
        format.html { render :new }
        format.json { render json: @edifici.errors, status: :unprocessable_entity }
      end
    end
  end

  def llistat_edificis
    @edificis = Edifici.all
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
    #Tancaments verticals
    @tancaments_vertical = TancamentsVertical.new
    @tancaments_vertical.edifici_id = edifici_id
    @tancaments_vertical.save
    #Coberta
    @coberta = Coberta.new
    @coberta.edifici_id = edifici_id
    @coberta.save
    #Particions
    @particio = Particio.new
    @particio.edifici_id = edifici_id
    @particio.save
    #Sanejament
    @sanejament = Sanejament.new
    @sanejament.edifici_id = edifici_id
    @sanejament.save
    #Subministrament aigua
    @aigua = Aigua.new
    @aigua.edifici_id = edifici_id
    @aigua.save
    #Instal·lació elèctrica
    @electricitat = Electricitat.new
    @electricitat.edifici_id = edifici_id
    @electricitat.save
    #Climatització
    @climatitzacio = Climatitzacio.new
    @climatitzacio.edifici_id = edifici_id
    @climatitzacio.save
    #Gas
    @ga = Ga.new
    @ga.edifici_id = edifici_id
    @ga.save
    #Ventilacio
    @ventilacio = Ventilacio.new
    @ventilacio.edifici_id = edifici_id
    @ventilacio.save
    #Incendis
    @incendi = Incendi.new
    @incendi.edifici_id = edifici_id
    @incendi.save
    #Ascensor
    @ascensor = Ascensor.new
    @ascensor.edifici_id = edifici_id
    @ascensor.save
    #Telecomunicacio
    @telecomunicacio = Telecomunicacio.new
    @telecomunicacio.edifici_id = edifici_id
    @telecomunicacio.save
    #Especial
    @especial = Especial.new
    @especial.edifici_id = edifici_id
    @especial.save
    #Checklist nou plurifamiliar
    @checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.new
    @checklist_nou_plurifamiliar.edifici_id = edifici_id
    @checklist_nou_plurifamiliar.save
    #Checklist nou unifamiliar
    @checklist_nou_unifamiliar = ChecklistNouUnifamiliar.new
    @checklist_nou_unifamiliar.edifici_id = edifici_id
    @checklist_nou_unifamiliar.save
    #Checklist existent plurifamiliar
    @checklist_existent_plurifamiliar = ChecklistExistentPlurifamiliar.new
    @checklist_existent_plurifamiliar.edifici_id = edifici_id
    @checklist_existent_plurifamiliar.save
    #Checklist nou terciari
    @checklist_nou_terciari = ChecklistNouTerciari.new
    @checklist_nou_terciari.edifici_id = edifici_id
    @checklist_nou_terciari.save
  end

  # PATCH/PUT /edificis/1
  # PATCH/PUT /edificis/1.json
  def update
    respond_to do |format|
      if @edifici.update(edifici_params)
        format.html { redirect_to edificis_path }
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
    # Abans d'eliminar l'edifici eliminem els nested resources
    @edifici.identificacio.destroy
    @edifici.fonamentacio.destroy
    @edifici.estructura.destroy
    @edifici.tancaments_vertical.destroy
    @edifici.coberta.destroy
    @edifici.particio.destroy
    @edifici.sanejament.destroy
    @edifici.aigua.destroy
    @edifici.electricitat.destroy
    @edifici.climatitzacio.destroy
    @edifici.ga.destroy
    @edifici.ventilacio.destroy
    @edifici.incendi.destroy
    @edifici.ascensor.destroy
    @edifici.telecomunicacio.destroy
    @edifici.especial.destroy
    @edifici.checklist_nou_plurifamiliar.destroy
    @edifici.checklist_nou_unifamiliar.destroy
    @edifici.checklist_existent_plurifamiliar.destroy
    @edifici.checklist_nou_terciari.destroy
    @edifici.promotors.each do |promotor|
      promotor.destroy
    end
    @edifici.projectistes.each do |projectista|
      projectista.destroy
    end
    @edifici.constructors.each do |constructor|
      constructor.destroy
    end
    @edifici.directors.each do |director|
      director.destroy
    end
    @edifici.execucio_directors.each do |execucio_director|
      execucio_director.destroy
    end
    @edifici.laboratoris.each do |laboratori|
      laboratori.destroy
    end
    @edifici.entitat_controls.each do |entitat_control|
      entitat_control.destroy
    end
    @edifici.subministradors.each do |subministrador|
      subministrador.destroy
    end
    @edifici.industrials.each do |industrial|
      industrial.destroy
    end
    @edifici.colaboradors.each do |colaborador|
      colaborador.destroy
    end
    @edifici.coordinadors.each do |coordinador|
      coordinador.destroy
    end
    @edifici.llicencies.each do |llicencia|
      llicencia.destroy
    end
    @edifici.declaracions.each do |declaracio|
      declaracio.destroy
    end
    @edifici.regim_propietats.each do |regim_propietat|
      regim_propietat.destroy
    end
    @edifici.regim_especials.each do |regim_especial|
      regim_especial.destroy
    end
    @edifici.carregues.each do |carrega|
      carrega.destroy
    end
    @edifici.entitats.each do |entitat|
      entitat.destroy
    end
    @edifici.garantia_promotors.each do |garantia_promotor|
      garantia_promotor.destroy
    end
    @edifici.garantia_constructors.each do |garantia_constructor|
      garantia_constructor.destroy
    end
    @edifici.garantia_instalacions.each do |garantia_instalacio|
      garantia_instalacio.destroy
    end
    @edifici.energia_certificats.each do |energia_certificat|
      energia_certificat.destroy
    end
    @edifici.aptitud_certificats.each do |aptitud_certificat|
      aptitud_certificat.destroy
    end
    @edifici.iites.each do |iite|
      iite.destroy
    end
    @edifici.elements.each do |element|
      element.destroy
    end
    @edifici.referencies.each do |referencia|
      referencia.destroy
    end
    @edifici.referencia_calendaris.each do |referencia_calendari|
      referencia_calendari.destroy
    end

    @edifici.destroy
    respond_to do |format|
      format.html { redirect_to edificis_url }
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
      params.require(:edifici).permit(:user_id, :nom_edifici, :tipus_edifici, :ref_cadastral)
    end
end
