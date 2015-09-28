class EdificisController < ApplicationController
  before_action :set_edifici, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  #layout 'edifici', only: [:quadern_nou_plurifamiliar]

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

        format.html { redirect_to edificis_path }
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
    @edifici.destroy
    respond_to do |format|
      format.html { redirect_to edificis_url }
      format.json { head :no_content }
    end
  end

  def duplicate
    @edifici = Edifici.find(params[:id])
    nou_edifici = @edifici.dup
    if params[:locale] == 'es'
      nou_edifici.nom_edifici = @edifici.nom_edifici + ' copia'
    else
      nou_edifici.nom_edifici = @edifici.nom_edifici + ' còpia'
    end
    nou_edifici.save
    duplicate_complements(@edifici.id, nou_edifici.id)
    redirect_to edificis_url
  end

  def duplicate_complements(id_edifici, id_nou_edifici)
    #Identificacio
    @identificacio = Identificacio.where(:edifici_id => id_edifici).last
    nova_identificacio = @identificacio.dup
    nova_identificacio.edifici_id = id_nou_edifici
    nova_identificacio.foto_facana = @identificacio.foto_facana
    nova_identificacio.planol_emplacament = @identificacio.planol_emplacament
    nova_identificacio.save
    #Fonamentacio
    @fonamentacio = Fonamentacio.where(:edifici_id => id_edifici).last
    nova_fonamentacio = @fonamentacio.dup
    nova_fonamentacio.edifici_id = id_nou_edifici
    nova_fonamentacio.save
    #Estructura
    @estructura = Estructura.where(:edifici_id => id_edifici).last
    nova_estructura = @estructura.dup
    nova_estructura.edifici_id = id_nou_edifici
    nova_estructura.save
    #Tancaments verticals
    @tancaments_vertical = TancamentsVertical.where(:edifici_id => id_edifici).last
    nova_tancaments_vertical = @tancaments_vertical.dup
    nova_tancaments_vertical.edifici_id = id_nou_edifici
    nova_tancaments_vertical.save
    #Coberta
    @coberta = Coberta.where(:edifici_id => id_edifici).last
    nova_coberta = @coberta.dup
    nova_coberta.edifici_id = id_nou_edifici
    nova_coberta.save
    #Particions
    @particio = Particio.where(:edifici_id => id_edifici).last
    nova_particio = @particio.dup
    nova_particio.edifici_id = id_nou_edifici
    nova_particio.save
    #Sanejament
    @sanejament = Sanejament.where(:edifici_id => id_edifici).last
    nova_sanejament = @sanejament.dup
    nova_sanejament.edifici_id = id_nou_edifici
    nova_sanejament.save
    #Subministrament d'aigua
    @aigua = Aigua.where(:edifici_id => id_edifici).last
    nova_aigua = @aigua.dup
    nova_aigua.edifici_id = id_nou_edifici
    nova_aigua.save
    #Instal·lació elèctrica
    @electricitat = Electricitat.where(:edifici_id => id_edifici).last
    nova_electricitat = @electricitat.dup
    nova_electricitat.edifici_id = id_nou_edifici
    nova_electricitat.save
    #Climatitzacio
    @climatitzacio = Climatitzacio.where(:edifici_id => id_edifici).last
    nova_climatitzacio = @climatitzacio.dup
    nova_climatitzacio.edifici_id = id_nou_edifici
    nova_climatitzacio.save
    #Gas
    @ga = Ga.where(:edifici_id => id_edifici).last
    nova_ga = @ga.dup
    nova_ga.edifici_id = id_nou_edifici
    nova_ga.save
    #Ventilacio
    @ventilacio = Ventilacio.where(:edifici_id => id_edifici).last
    nova_ventilacio = @ventilacio.dup
    nova_ventilacio.edifici_id = id_nou_edifici
    nova_ventilacio.save
    #Incendis
    @incendi = Incendi.where(:edifici_id => id_edifici).last
    nova_incendi = @incendi.dup
    nova_incendi.edifici_id = id_nou_edifici
    nova_incendi.save
    #Ascensors
    @ascensor = Ascensor.where(:edifici_id => id_edifici).last
    nova_ascensor = @ascensor.dup
    nova_ascensor.edifici_id = id_nou_edifici
    nova_ascensor.save
    #Telecomunicacions
    @telecomunicacio = Telecomunicacio.where(:edifici_id => id_edifici).last
    nova_telecomunicacio = @telecomunicacio.dup
    nova_telecomunicacio.edifici_id = id_nou_edifici
    nova_telecomunicacio.save
    #Especials
    @especial = Especial.where(:edifici_id => id_edifici).last
    nova_especial = @especial.dup
    nova_especial.edifici_id = id_nou_edifici
    nova_especial.save
    #Checklist nou plurifamiliar
    @checklist_nou_plurifamiliar = ChecklistNouPlurifamiliar.where(:edifici_id => id_edifici).last
    nova_checklist_nou_plurifamiliar = @checklist_nou_plurifamiliar.dup
    nova_checklist_nou_plurifamiliar.edifici_id = id_nou_edifici
    nova_checklist_nou_plurifamiliar.save
    #Checklist nou unifamiliar
    @checklist_nou_unifamiliar = ChecklistNouUnifamiliar.where(:edifici_id => id_edifici).last
    nova_checklist_nou_unifamiliar = @checklist_nou_unifamiliar.dup
    nova_checklist_nou_unifamiliar.edifici_id = id_nou_edifici
    nova_checklist_nou_unifamiliar.save
    #Promotors
    promotors = Promotor.where(:edifici_id => id_edifici)
    promotors.each do |promotor|
      nou_promotor = promotor.dup
      nou_promotor.edifici_id = id_nou_edifici
      nou_promotor.save
    end
    #Projectistes
    projectistes = Projectista.where(:edifici_id => id_edifici)
    projectistes.each do |projectista|
      nou_projectista = projectista.dup
      nou_projectista.edifici_id = id_nou_edifici
      nou_projectista.save
    end
    #Constructors
    constructors = Constructor.where(:edifici_id => id_edifici)
    constructors.each do |constructor|
      nou_constructor = constructor.dup
      nou_constructor.edifici_id = id_nou_edifici
      nou_constructor.save
    end
    #Directors d'obra
    directors = Director.where(:edifici_id => id_edifici)
    directors.each do |director|
      nou_director = director.dup
      nou_director.edifici_id = id_nou_edifici
      nou_director.save
    end
    #Directors d'execució d'obra
    execucio_directors = ExecucioDirector.where(:edifici_id => id_edifici)
    execucio_directors.each do |execucio_director|
      nou_execucio_director = execucio_director.dup
      nou_execucio_director.edifici_id = id_nou_edifici
      nou_execucio_director.save
    end
    #Laboratoris de control
    laboratoris = Laboratori.where(:edifici_id => id_edifici)
    laboratoris.each do |laboratori|
      nou_laboratori = laboratori.dup
      nou_laboratori.edifici_id = id_nou_edifici
      nou_laboratori.save
    end
    #Entitats de control
    entitats = EntitatControl.where(:edifici_id => id_edifici)
    entitats.each do |entitat|
      nou_entitat = entitat.dup
      nou_entitat.edifici_id = id_nou_edifici
      nou_entitat.save
    end
    #Subministradors de productes
    subministradors = Subministrador.where(:edifici_id => id_edifici)
    subministradors.each do |subministrador|
      nou_subministrador = subministrador.dup
      nou_subministrador.edifici_id = id_nou_edifici
      nou_subministrador.save
    end
    #Industrials
    industrials = Industrial.where(:edifici_id => id_edifici)
    industrials.each do |industrial|
      nou_industrial = industrial.dup
      nou_industrial.edifici_id = id_nou_edifici
      nou_industrial.save
    end
    #Llicencies
    llicencies = Llicencia.where(:edifici_id => id_edifici)
    llicencies.each do |llicencia|
      nou_llicencia = llicencia.dup
      nou_llicencia.edifici_id = id_nou_edifici
      nou_llicencia.save
    end
    #Declaració d'obra nova
    declaracions = Declaracio.where(:edifici_id => id_edifici)
    declaracions.each do |declaracio|
      nou_declaracio = declaracio.dup
      nou_declaracio.edifici_id = id_nou_edifici
      nou_declaracio.save
    end
    #Règim de propietat
    regim_propietats = RegimPropietat.where(:edifici_id => id_edifici)
    regim_propietats.each do |regim_propietat|
      nou_regim_propietat = regim_propietat.dup
      nou_regim_propietat.edifici_id = id_nou_edifici
      nou_regim_propietat.save
    end
    #Règims especials
    regim_especials = RegimEspecial.where(:edifici_id => id_edifici)
    regim_especials.each do |regim_especial|
      nou_regim_especial = regim_especial.dup
      nou_regim_especial.edifici_id = id_nou_edifici
      nou_regim_especial.save
    end
    #Càrregues reals
    carregues = Carrega.where(:edifici_id => id_edifici)
    carregues.each do |carrega|
      nou_carrega = carrega.dup
      nou_carrega.edifici_id = id_nou_edifici
      nou_carrega.save
    end
    #Entitats jurídiques
    entitats = Entitat.where(:edifici_id => id_edifici)
    entitats.each do |entitat|
      nou_entitat = entitat.dup
      nou_entitat.edifici_id = id_nou_edifici
      nou_entitat.save
    end
    #Garanties dels promotors
    garantia_promotors = GarantiaPromotor.where(:edifici_id => id_edifici)
    garantia_promotors.each do |garantia_promotor|
      nou_garantia_promotor = garantia_promotor.dup
      nou_garantia_promotor.edifici_id = id_nou_edifici
      nou_garantia_promotor.save
    end
    #Garanties de les instal·lacions
    garantia_instalacions = GarantiaInstalacio.where(:edifici_id => id_edifici)
    garantia_instalacions.each do |garantia_instalacio|
      nou_garantia_instalacio = garantia_instalacio.dup
      nou_garantia_instalacio.edifici_id = id_nou_edifici
      nou_garantia_instalacio.save
    end
    #Referencies
    referencies = Referencia.where(:edifici_id => id_edifici)
    referencies.each do |referencia|
      nova_referencia = referencia.dup
      nova_referencia.edifici_id = id_nou_edifici
      nova_referencia.save
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
