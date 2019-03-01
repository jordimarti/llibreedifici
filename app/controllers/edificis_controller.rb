class EdificisController < ApplicationController
  before_action :set_edifici, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /edificis
  # GET /edificis.json
  def index
    @edificis = Edifici.where(user_id: current_user.id).order(created_at: :desc)
    @edificis_editor = Edifici.where(editor_nif: current_user.nif).order(created_at: :desc)
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
    if current_user.role == 'cambra'
      @edifici.creador = 'cambra'
    end
    respond_to do |format|
      if @edifici.save
        #Aquí creem els objectes complementaris a l'edifici (dades_edifici, checklist...)
        create_complements(@edifici.id)

        if current_user.role == 'cambra'
          format.html { redirect_to edificis_path }
        else
          format.html { redirect_to validar_dades_path(@edifici.id) }
          format.json { render :show, status: :created, location: @edifici }
        end
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

  def duplicate
    edifici = Edifici.find(params[:id])
    nou_edifici = edifici.dup
    nou_edifici.nom_edifici = nou_edifici.nom_edifici + " copia"
    nou_edifici.save

    identificacio = Identificacio.find(edifici)
    nou_identificacio = identificacio.dup
    nou_identificacio.edifici_id = nou_edifici.id
    nou_identificacio.planol_emplacament.clear
    nou_identificacio.foto_facana.clear
    nou_identificacio.foto_facana_2.clear
    nou_identificacio.foto_facana_3.clear
    nou_identificacio.logo_empresa.clear
    nou_identificacio.save

    fonamentacio = Fonamentacio.find(edifici)
    nou_fonamentacio = fonamentacio.dup
    nou_fonamentacio.edifici_id = nou_edifici.id
    nou_fonamentacio.save

    estructura = Estructura.find(edifici)
    nou_estructura = estructura.dup
    nou_estructura.edifici_id = nou_edifici.id
    nou_estructura.save

    tancaments_vertical = TancamentsVertical.find(edifici)
    nou_tancaments_vertical = tancaments_vertical.dup
    nou_tancaments_vertical.edifici_id = nou_edifici.id
    nou_tancaments_vertical.save

    coberta = Coberta.find(edifici)
    nou_coberta = coberta.dup
    nou_coberta.edifici_id = nou_edifici.id
    nou_coberta.save

    particio = Particio.find(edifici)
    nou_particio = particio.dup
    nou_particio.edifici_id = nou_edifici.id
    nou_particio.save

    sanejament = Sanejament.find(edifici)
    nou_sanejament = sanejament.dup
    nou_sanejament.edifici_id = nou_edifici.id
    nou_sanejament.save

    aigua = Aigua.find(edifici)
    nou_aigua = aigua.dup
    nou_aigua.edifici_id = nou_edifici.id
    nou_aigua.save

    electricitat = Electricitat.find(edifici)
    nou_electricitat = electricitat.dup
    nou_electricitat.edifici_id = nou_edifici.id
    nou_electricitat.save

    climatitzacio = Climatitzacio.find(edifici)
    nou_climatitzacio = climatitzacio.dup
    nou_climatitzacio.edifici_id = nou_edifici.id
    nou_climatitzacio.save

    ga = Ga.find(edifici)
    nou_ga = ga.dup
    nou_ga.edifici_id = nou_edifici.id
    nou_ga.save

    ventilacio = Ventilacio.find(edifici)
    nou_ventilacio = ventilacio.dup
    nou_ventilacio.edifici_id = nou_edifici.id
    nou_ventilacio.save

    incendi = Incendi.find(edifici)
    nou_incendi = incendi.dup
    nou_incendi.edifici_id = nou_edifici.id
    nou_incendi.save

    ascensor = Ascensor.find(edifici)
    nou_ascensor = ascensor.dup
    nou_ascensor.edifici_id = nou_edifici.id
    nou_ascensor.save

    telecomunicacio = Telecomunicacio.find(edifici)
    nou_telecomunicacio = telecomunicacio.dup
    nou_telecomunicacio.edifici_id = nou_edifici.id
    nou_telecomunicacio.save

    especial = Especial.find(edifici)
    nou_especial = especial.dup
    nou_especial.edifici_id = nou_edifici.id
    nou_especial.save

    checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.find(edifici)
    nou_checklist_nou_plurifamiliar = checklist_nou_plurifamiliar.dup
    nou_checklist_nou_plurifamiliar.edifici_id = nou_edifici.id
    nou_checklist_nou_plurifamiliar.save

    checklist_nou_unifamiliar = ChecklistNouUnifamiliar.find(edifici)
    nou_checklist_nou_unifamiliar = checklist_nou_unifamiliar.dup
    nou_checklist_nou_unifamiliar.edifici_id = nou_edifici.id
    nou_checklist_nou_unifamiliar.save

    checklist_existent_plurifamiliar = ChecklistExistentPlurifamiliar.find(edifici)
    nou_checklist_existent_plurifamiliar = checklist_existent_plurifamiliar.dup
    nou_checklist_existent_plurifamiliar.edifici_id = nou_edifici.id
    nou_checklist_existent_plurifamiliar.save

    checklist_nou_terciari = ChecklistNouTerciari.find(edifici)
    nou_checklist_nou_terciari = checklist_nou_terciari.dup
    nou_checklist_nou_terciari.edifici_id = nou_edifici.id
    nou_checklist_nou_terciari.save

    edifici.promotors.each do |promotor|
      nou_promotor = promotor.dup
      nou_promotor.edifici_id = nou_edifici.id
      nou_promotor.save
    end

    edifici.projectistes.each do |projectista|
      nou_projectista = projectista.dup
      nou_projectista.edifici_id = nou_edifici.id
      nou_projectista.save
    end

    edifici.constructors.each do |constructor|
      nou_constructor = constructor.dup
      nou_constructor.edifici_id = nou_edifici.id
      nou_constructor.save
    end

    edifici.directors.each do |director|
      nou_director = director.dup
      nou_director.edifici_id = nou_edifici.id
      nou_director.save
    end

    edifici.execucio_directors.each do |execucio_director|
      nou_execucio_director = execucio_director.dup
      nou_execucio_director.edifici_id = nou_edifici.id
      nou_execucio_director.save
    end

    edifici.laboratoris.each do |laboratori|
      nou_laboratori = laboratori.dup
      nou_laboratori.edifici_id = nou_edifici.id
      nou_laboratori.save
    end

    edifici.entitat_controls.each do |entitat_control|
      nou_entitat_control = entitat_control.dup
      nou_entitat_control.edifici_id = nou_edifici.id
      nou_entitat_control.save
    end

    edifici.subministradors.each do |subministrador|
      nou_subministrador = subministrador.dup
      nou_subministrador.edifici_id = nou_edifici.id
      nou_subministrador.save
    end

    edifici.industrials.each do |industrial|
      nou_industrial = industrial.dup
      nou_industrial.edifici_id = nou_edifici.id
      nou_industrial.save
    end

    edifici.colaboradors.each do |colaborador|
      nou_colaborador = colaborador.dup
      nou_colaborador.edifici_id = nou_edifici.id
      nou_colaborador.save
    end

    edifici.coordinadors.each do |coordinador|
      nou_coordinador = coordinador.dup
      nou_coordinador.edifici_id = nou_edifici.id
      nou_coordinador.save
    end

    edifici.llicencies.each do |llicencia|
      nou_llicencia = llicencia.dup
      nou_llicencia.edifici_id = nou_edifici.id
      nou_llicencia.save
    end

    edifici.declaracions.each do |declaracio|
      nou_declaracio = declaracio.dup
      nou_declaracio.edifici_id = nou_edifici.id
      nou_declaracio.save
    end

    edifici.regim_propietats.each do |regim_propietat|
      nou_regim_propietat = regim_propietat.dup
      nou_regim_propietat.edifici_id = nou_edifici.id
      nou_regim_propietat.save
    end

    edifici.regim_especials.each do |regim_especial|
      nou_regim_especial = regim_especial.dup
      nou_regim_especial.edifici_id = nou_edifici.id
      nou_regim_especial.save
    end

    edifici.carregues.each do |carrega|
      nou_carrega = carrega.dup
      nou_carrega.edifici_id = nou_edifici.id
      nou_carrega.save
    end

    edifici.entitats.each do |entitat|
      nou_entitat = entitat.dup
      nou_entitat.edifici_id = nou_edifici.id
      nou_entitat.save
    end

    edifici.garantia_promotors.each do |garantia_promotor|
      nou_garantia_promotor = garantia_promotor.dup
      nou_garantia_promotor.edifici_id = nou_edifici.id
      nou_garantia_promotor.save
    end

    edifici.garantia_constructors.each do |garantia_constructor|
      nou_garantia_constructor = garantia_constructor.dup
      nou_garantia_constructor.edifici_id = nou_edifici.id
      nou_garantia_constructor.save
    end

    edifici.garantia_instalacions.each do |garantia_instalacio|
      nou_garantia_instalacio = garantia_instalacio.dup
      nou_garantia_instalacio.edifici_id = nou_edifici.id
      nou_garantia_instalacio.save
    end

    edifici.energia_certificats.each do |energia_certificat|
      nou_energia_certificat = energia_certificat.dup
      nou_energia_certificat.edifici_id = nou_edifici.id
      nou_energia_certificat.save
    end

    edifici.aptitud_certificats.each do |aptitud_certificat|
      nou_aptitud_certificat = aptitud_certificat.dup
      nou_aptitud_certificat.edifici_id = nou_edifici.id
      nou_aptitud_certificat.save
    end

    edifici.iites.each do |iite|
      nou_iite = iite.dup
      nou_iite.edifici_id = nou_edifici.id
      nou_iite.save
    end

    edifici.elements.each do |element|
      nou_element = element.dup
      nou_element.edifici_id = nou_edifici.id
      nou_element.save
    end

    edifici.referencies.each do |referencia|
      nou_referencia = referencia.dup
      nou_referencia.edifici_id = nou_edifici.id
      nou_referencia.save
    end

    edifici.referencia_calendaris.each do |referencia_calendari|
      nou_referencia_calendari = referencia_calendari.dup
      nou_referencia_calendari.edifici_id = nou_edifici.id
      nou_referencia_calendari.save
    end

    redirect_to edificis_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edifici
      @edifici = Edifici.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edifici_params
      params.require(:edifici).permit(:user_id, :nom_edifici, :tipus_edifici, :ref_cadastral, :creador, :editor_correu, :editor_nif)
    end
end
