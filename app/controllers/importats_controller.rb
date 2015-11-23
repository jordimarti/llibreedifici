class ImportatsController < ApplicationController
  before_action :set_importat, only: [:show, :edit, :update, :destroy]
  before_action :set_edificis

  # GET /importats
  # GET /importats.json
  def index
    @importats = Importat.all
  end

  # GET /importats/1
  # GET /importats/1.json
  def show
    #send_data(@importat.file_contents,
    #type: @importat.content_type,
    #filename: @importat.filename)
  end

  # GET /importats/new
  def new
    @importat = Importat.new
  end

  # GET /importats/1/edit
  def edit
  end

  # POST /importats
  # POST /importats.json
  def create
    @importat = Importat.new(importat_params)

    respond_to do |format|
      if @importat.save
        # Creem l'objecte amb les dades necessàries
        data_hash = JSON.parse(@importat.file_contents)
        # Comprovem que l'edifici pertany a l'usuari
        if data_hash['user_id'] != current_user.id
          flash[:alert] = "Aquest projecte pertany a un altre usuari"
          render "edificis/index"
          break
        end
        # Comprovem que l'edifici no estigui ja a la base de dades. S'hauria d'haver esborrat abans.
        edifici_existeix = Edifici.where(:id => data_hash['id'])
        unless edifici_existeix.blank?
          flash[:alert] = "Aquest edifici ja està a la base de dades"
          render "edificis/index"
          break
        end
        
        # Creem tots els objectes
        edifici = Edifici.new
        edifici.id = data_hash['id']
        edifici.user_id = data_hash['user_id']
        edifici.nom_edifici = data_hash['nom_edifici']
        edifici.tipus_edifici = data_hash['tipus_edifici']
        edifici.save
        identificacio = Identificacio.new(data_hash['identificacio'])
        identificacio.foto_facana_content_type = nil
        identificacio.foto_facana_file_name = nil
        identificacio.foto_facana_file_size = nil
        identificacio.foto_facana_updated_at = nil
        identificacio.planol_emplacament_content_type = nil
        identificacio.planol_emplacament_file_name = nil
        identificacio.planol_emplacament_file_size = nil
        identificacio.planol_emplacament_updated_at = nil
        identificacio.save
        fonamentacio = Fonamentacio.new(data_hash['fonamentacio'])
        fonamentacio.save
        estructura = Estructura.new(data_hash['estructura'])
        estructura.save
        tancaments_vertical = TancamentsVertical.new(data_hash['tancaments_vertical'])
        tancaments_vertical.save
        coberta = Coberta.new(data_hash['coberta'])
        coberta.save
        particio = Particio.new(data_hash['particio'])
        particio.save
        sanejament = Sanejament.new(data_hash['sanejament'])
        sanejament.save
        aigua = Aigua.new(data_hash['aigua'])
        aigua.save
        electricitat = Electricitat.new(data_hash['electricitat'])
        electricitat.save
        climatitzacio = Climatitzacio.new(data_hash['climatitzacio'])
        climatitzacio.save
        ga = Ga.new(data_hash['ga'])
        ga.save
        ventilacio = Ventilacio.new(data_hash['ventilacio'])
        ventilacio.save
        incendi = Incendi.new(data_hash['incendi'])
        incendi.save
        ascensor = Ascensor.new(data_hash['ascensor'])
        ascensor.save
        telecomunicacio = Telecomunicacio.new(data_hash['telecomunicacio'])
        telecomunicacio.save
        especial = Especial.new(data_hash['especial'])
        especial.save
        checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.new(data_hash['checklist_nou_plurifamiliar'])
        checklist_nou_plurifamiliar.save
        checklist_nou_unifamiliar = ChecklistNouUnifamiliar.new(data_hash['checklist_nou_unifamiliar'])
        checklist_nou_unifamiliar.save
        checklist_existent_plurifamiliar = ChecklistExistentPlurifamiliar.new(data_hash['checklist_existent_plurifamiliar'])
        checklist_existent_plurifamiliar.save
        promotors = data_hash['promotors']
        if promotors
          promotors.each do |promotor|
            nou_promotor = Promotor.new(promotor)
            nou_promotor.save
          end
        end
        projectistes = data_hash['projectistes']
        if projectistes
          projectistes.each do |projectista|
            nou_projectista = Projectista.new(projectista)
            nou_projectista.save
          end
        end
        constructors = data_hash['constructors']
        if constructors
          constructors.each do |constructor|
            nou_constructor = Constructor.new(constructor)
            nou_constructor.save
          end
        end
        directors = data_hash['directors']
        if directors
          directors.each do |director|
            nou_director = Director.new(director)
            nou_director.save
          end
        end
        execucio_directors = data_hash['execucio_directors']
        if execucio_directors
          execucio_directors.each do |execucio_director|
            nou_execucio_director = ExecucioDirector.new(execucio_director)
            nou_execucio_director.save
          end
        end
        laboratoris = data_hash['laboratoris']
        if laboratoris
          laboratoris.each do |laboratori|
            nou_laboratori = Laboratori.new(laboratori)
            nou_laboratori.save
          end
        end
        entitat_controls = data_hash['entitat_controls']
        if entitat_controls
          entitat_controls.each do |entitat_control|
            nou_entitat_control = EntitatControl.new(entitat_control)
            nou_entitat_control.save
          end
        end
        subministradors = data_hash['subministradors']
        if subministradors
          subministradors.each do |subministrador|
            nou_subministrador = Subministrador.new(subministrador)
            nou_subministrador.save
          end
        end
        industrials = data_hash['industrials']
        if industrials
          industrials.each do |industrial|
            nou_industrial = Industrial.new(industrial)
            nou_industrial.save
          end
        end
        colaboradors = data_hash['colaboradors']
        if colaboradors
          colaboradors.each do |colaborador|
            nou_colaborador = Colaborador.new(colaborador)
            nou_colaborador.save
          end
        end
        coordinadors = data_hash['coordinadors']
        if coordinadors
          coordinadors.each do |coordinador|
            nou_coordinador = Coordinador.new(coordinador)
            nou_coordinador.save
          end
        end
        llicencies = data_hash['llicencies']
        if llicencies
          llicencies.each do |llicencia|
            nou_llicencia = Llicencia.new(llicencia)
            nou_llicencia.save
          end
        end
        declaracions = data_hash['declaracions']
        if declaracions
          declaracions.each do |declaracio|
            nou_declaracio = Declaracio.new(declaracio)
            nou_declaracio.save
          end
        end
        regim_propietats = data_hash['regim_propietats']
        if regim_propietats
          regim_propietats.each do |regim_propietat|
            nou_regim_propietat = RegimPropietat.new(regim_propietat)
            nou_regim_propietat.save
          end
        end
        regim_especials = data_hash['regim_especials']
        if regim_especials
          regim_especials.each do |regim_especial|
            nou_regim_especial = RegimEspecial.new(regim_especial)
            nou_regim_especial.save
          end
        end
        carregues = data_hash['carregues']
        if carregues
          carregues.each do |carrega|
            nou_carrega = Carrega.new(carrega)
            nou_carrega.save
          end
        end
        entitats = data_hash['entitats']
        if entitats
          entitats.each do |entitat|
            nou_entitat = Entitat.new(entitat)
            nou_entitat.save
          end
        end
        garantia_promotors = data_hash['garantia_promotors']
        if garantia_promotors
          garantia_promotors.each do |garantia_promotor|
            nou_garantia_promotor = GarantiaPromotor.new(garantia_promotor)
            nou_garantia_promotor.save
          end
        end
        garantia_constructors = data_hash['garantia_constructors']
        if garantia_constructors
          garantia_constructors.each do |garantia_constructor|
            nou_garantia_constructor = GarantiaConstructor.new(garantia_constructor)
            nou_garantia_constructor.save
          end
        end
        garantia_instalacions = data_hash['garantia_instalacions']
        if garantia_instalacions
          garantia_instalacions.each do |garantia_instalacio|
            nou_garantia_instalacio = GarantiaInstalacio.new(garantia_instalacio)
            nou_garantia_instalacio.save
          end
        end
        energia_certificats = data_hash['energia_certificats']
        if energia_certificats
          energia_certificats.each do |energia_certificat|
            nou_energia_certificat = EnergiaCertificat.new(energia_certificat)
            nou_energia_certificat.save
          end
        end
        aptitud_certificat = data_hash['aptitud_certificat']
        if aptitud_certificat
          aptitud_certificat.each do |aptitud_certificat|
            nou_aptitud_certificat = AptitudCertificat.new(aptitud_certificat)
            nou_aptitud_certificat.save
          end
        end
        iites = data_hash['iites']
        if iites
          iites.each do |iite|
            nou_iite = Iite.new(iite)
            nou_iite.save
          end
        end
        elements = data_hash['elements']
        if elements
          elements.each do |element|
            nou_element = Element.new(element)
            nou_element.save
          end
        end
        referencies = data_hash['referencies']
        if referencies
          referencies.each do |referencia|
            nou_referencia = Referencia.new(referencia)
            nou_referencia.save
          end
        end
        referencia_calendaris = data_hash['referencia_calendaris']
        if referencia_calendaris
          referencia_calendaris.each do |referencia_calendari|
            nou_referencia_calendari = ReferenciaCalendari.new(referencia_calendari)
            nou_referencia_calendari.save
          end
        end

        format.html { redirect_to edificis_path }
        format.json { render :show, status: :created, location: @importat }
      else
        format.html { render :new }
        format.json { render json: @importat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importats/1
  # PATCH/PUT /importats/1.json
  def update
    respond_to do |format|
      if @importat.update(importat_params)
        format.html { redirect_to @importat, notice: 'Importat was successfully updated.' }
        format.json { render :show, status: :ok, location: @importat }
      else
        format.html { render :edit }
        format.json { render json: @importat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importats/1
  # DELETE /importats/1.json
  def destroy
    @importat.destroy
    respond_to do |format|
      format.html { redirect_to importats_url, notice: 'Importat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importat
      @importat = Importat.find(params[:id])
    end

    def set_edificis
      @edificis = Edifici.where(user_id: current_user.id).order(created_at: :desc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def importat_params
      params.require(:importat).permit(:file)
    end
end
