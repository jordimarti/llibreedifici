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

    @referencies_fonamentacio = @referencies.where(:sistema => 'fonamentacio')
    @referencies_estructura = @referencies.where(:sistema => 'estructura')
    @referencies_tancaments = @referencies.where(:sistema => 'tancaments')
    @referencies_coberta = @referencies.where(:sistema => 'cobertes')
    @referencies_sanejament = @referencies.where(:sistema => 'sanejament')
    @referencies_aigua = @referencies.where(:sistema => 'aigua')
    @referencies_electricitat = @referencies.where(:sistema => 'electricitat')
    @referencies_gas = @referencies.where(:sistema => 'gas')
    @referencies_clima = @referencies.where(:sistema => 'climatitzacio')
    @referencies_ventilacio = @referencies.where(:sistema => 'ventilacio')
    @referencies_incendis = @referencies.where(:sistema => 'incendis')
    @referencies_ascensors = @referencies.where(:sistema => 'ascensors')
    @referencies_ict = @referencies.where(:sistema => 'ict')
    
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

    tancament = TancamentsVertical.where(:edifici_id => @edifici.id).last
    if (tancament.acabat_revestit_arrebossat_pintat == true || tancament.acabat_revestit_estucat == true || tancament.acabat_revestit_morter_monocapa == true || tancament.acabat_revestit_aplacat_ceramic == true || tancament.acabat_revestit_aplacat_pedra == true || tancament.acabat_revestit_xapa_metalica == true)
      crear_referencia(26)
      crear_referencia(27)
    end
    if (tancament.acabat_vist_paredat == true || tancament.acabat_vist_carreus == true || tancament.acabat_vist_fabrica_mao == true || tancament.acabat_vist_fabrica_bloc_ceramic == true || tancament.acabat_vist_bloc_formigo == true || tancament.acabat_vist_panell_formigo == true || tancament.acabat_vist_panell_metalic_sandwich == true)
      crear_referencia(28)
    end
    if (tancament.fusteria_fusta == true || tancament.fusteria_acer == true || tancament.fusteria_alumini == true || tancament.fusteria_pvc == true)
      crear_referencia(29)
      crear_referencia(30)
      crear_referencia(31)
      crear_referencia(32)
      crear_referencia(33)
      crear_referencia(34)
      crear_referencia(35)
      crear_referencia(36)
    end

    coberta = Coberta.where(:edifici_id => @edifici.id).last
    if (coberta.terrat_transitable == true)
      crear_referencia(37)
    end
    if (coberta.terrat_transitable == true || coberta.terrat_no_transitable == true)     
      crear_referencia(38)
      crear_referencia(39)
    end
    if (coberta.terrat_no_transitable == true)
      crear_referencia(40)
      crear_referencia(41)
    end
    if (coberta.coberta_teula_arab == true || coberta.coberta_teula_plana == true || coberta.coberta_teula_ciment == true || coberta.coberta_pissarra == true || coberta.coberta_fibrociment == true || coberta.coberta_asfaltica == true || coberta.coberta_xapa_acer == true || coberta.coberta_xapa_coure == true)
      crear_referencia(42)
      crear_referencia(43)
      crear_referencia(44)
    end

    sanejament = Sanejament.where(:edifici_id => @edifici.id).last
    if (sanejament.si_sistema_evacuacio == true)
      if (coberta.terrat_transitable == true)
        crear_referencia(45)
      else
        crear_referencia(46)
      end
      crear_referencia(47)
      crear_referencia(48)
      crear_referencia(49)
      crear_referencia(52)
      if (sanejament.colectors_vistos == true)
        crear_referencia(50)
        crear_referencia(54)
      end
      if (sanejament.bomba_elevacio == true)
        crear_referencia(51)
      end
      if (sanejament.separador_greixos == true)
        crear_referencia(53)
      end
      if (sanejament.fosa_septica == true)
        crear_referencia(55)
      end
    end

    aigua = Aigua.where(:edifici_id => @edifici.id).last
    if (aigua.grup_pressio == true)
      crear_referencia(56)
    end

    electricitat = Electricitat.where(:edifici_id => @edifici.id).last
    if (electricitat.enllumenat_comunitari == true)
      crear_referencia(61)
      crear_referencia(62)
    end
    if (electricitat.mes_100k == true)
      crear_referencia(57)
    end
    if (electricitat.connexio_terra == true)
      crear_referencia(59)
      crear_referencia(60)
    end
    if (electricitat.centre_transformacio == true)
      crear_referencia(63)
    end
    if (electricitat.fotovoltaica == true)
      crear_referencia(64)
      crear_referencia(65)
      crear_referencia(66)
      crear_referencia(67)
      crear_referencia(68)
      crear_referencia(69)
    end
    if (electricitat.comptador_unic == true || electricitat.comptadors_individuals_habitatge == true || electricitat.comptadors_centralitzats == true)
      crear_referencia(58)
    end

    redirect_to action: "index"
  end

  def crear_referencia(id_operacio)
    operacio = Operacio.find(id_operacio)
    referencia = Referencia.new
    referencia.operacio_id = operacio.id
    referencia.sistema = operacio.sistema
    referencia.manual_habitatge = operacio.manual_habitatge
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
