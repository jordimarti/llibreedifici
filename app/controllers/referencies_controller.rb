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

    @sistemes = [{name: 'fonamentacio'}, {name: 'estructura'}, {name: 'tancaments'}, {name: 'cobertes'}, {name: 'particions'}, {name: 'sanejament'}, {name: 'aigua'}, {name: 'electricitat'}, {name: 'gas'}, {name: 'climatitzacio'}, {name: 'ventilacio'}, {name: 'incendis'}, {name: 'ascensor'}, {name: 'telecomunicacions'}, {name: 'especials'}]
  end

  #Aquest mètode consulta la definició de l'edifici i crea el llistat de referències a les operacions de manteniment
  def crear_llistat
    #Primer eliminem totes les referències abans de crear-les de nou, en cas que aquell edifici ja en tingui
    @referencies.each do |referencia|
      if referencia.creat_usuari == false
        referencia.destroy
      end
    end

    fonamentacio = Fonamentacio.where(:edifici_id => @edifici.id).last
    if (fonamentacio.mur_pedra == true || fonamentacio.mur_fabrica_mao == true || fonamentacio.mur_fabrica_bloc == true || fonamentacio.mur_formigo_armat || fonamentacio.mur_pantalla)
      crear_referencia(2)
      crear_referencia(3)
      crear_referencia(4)
      crear_referencia(5)
    end
    if (fonamentacio.sabates_paredat == true || fonamentacio.sabates_aillades == true || fonamentacio.sabates_continues == true || fonamentacio.llosa == true || fonamentacio.formigo == true || fonamentacio.formigo_armat == true || fonamentacio.pilons == true || fonamentacio.pantalles == true) 
      crear_referencia(1)
    end

    #estructura = Estructura.where(:edifici_id => @edifici.id).last
    #if (estructura.parets_pedra == true)
    #  crear_referencia(7)
    #end
    #if (estructura.pilars_acer == true)
    #  crear_referencia(11)
    #  crear_referencia(12)
    #  crear_referencia(13)
    #  crear_referencia(14)
    #end
    #if (estructura.parets_formigo_armat == true || estructura.pilars_formigo_armat == true)
    #  crear_referencia(15)
    #  crear_referencia(16)
    #end
    #if (estructura.parets_fabrica_mao == true || estructura.parets_bloc_ceramic == true || estructura.parets_bloc_formigo == true || estructura.pilars_mao == true)
    #  crear_referencia(8)
    #end
    #if (estructura.parets_entramat_fusta == true)
    #  crear_referencia(17)
    #end
    #if (estructura.bigues_fusta == true || estructura.forjat_fusta == true)
    #  crear_referencia(20)
    #end
    #if (estructura.bigues_metaliques == true || estructura.forjat_metalic == true)
    #  crear_referencia(21)
    #  crear_referencia(22)
    #  crear_referencia(23)
    #end
    #if (estructura.bigues_formigo_armat == true || estructura.forjat_formigo_armat == true || estructura.forjat_reticular == true || estructura.llosa_formigo == true)
    #  crear_referencia(24)
    #  crear_referencia(25)
    #end
    #if (estructura.forjat_sanitari == true || estructura.solera == true)
    #  crear_referencia(6)
    #end

    #tancament = TancamentsVertical.where(:edifici_id => @edifici.id).last
    #if (tancament.acabat_revestit_arrebossat_pintat == true || tancament.acabat_revestit_estucat == true || tancament.acabat_revestit_morter_monocapa == true || tancament.acabat_revestit_aplacat_ceramic == true || tancament.acabat_revestit_aplacat_pedra == true || tancament.acabat_revestit_xapa_metalica == true)
    #  crear_referencia(26)
    #  crear_referencia(27)
    #end
    #if (tancament.acabat_vist_paredat == true || tancament.acabat_vist_carreus == true || tancament.acabat_vist_fabrica_mao == true || tancament.acabat_vist_fabrica_bloc_ceramic == true || tancament.acabat_vist_bloc_formigo == true || tancament.acabat_vist_panell_formigo == true || tancament.acabat_vist_panell_metalic_sandwich == true)
    #  crear_referencia(28)
    #end
    #if (tancament.fusteria_fusta == true || tancament.fusteria_acer == true || tancament.fusteria_alumini == true || tancament.fusteria_pvc == true)
    #  crear_referencia(29)
    #  crear_referencia(30)
    #  crear_referencia(31)
    #  crear_referencia(32)
    #  crear_referencia(33)
    #  crear_referencia(34)
    #  crear_referencia(35)
    #  crear_referencia(36)
    #end

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

    gas = Ga.where(:edifici_id => @edifici.id).last
    if (gas.instalacio_gas == true)
      crear_referencia(70)
    end
    if (gas.diposit_aire_lliure == true || gas.diposit_enterrat == true)
      crear_referencia(71)
      crear_referencia(72)
    end
    if (gas.diposit_enterrat == true)
      crear_referencia(73)
    end

    climatitzacio = Climatitzacio.where(:edifici_id => @edifici.id).last
    if (climatitzacio.escalfador_pn_menor_24 == true)
      crear_referencia(74)
      crear_referencia(75)
      crear_referencia(76)
    end
    if (climatitzacio.escalfador_pn_24_70 == true)
      crear_referencia(77)
      crear_referencia(78)
      crear_referencia(79)
    end
    if (climatitzacio.escalfador_pn_major_70 == true)
      crear_referencia(80)
      crear_referencia(81)
      crear_referencia(82)
    end
    if (climatitzacio.caldera_gas_pn_menor_70 == true)
      crear_referencia(83)
      crear_referencia(84)
      crear_referencia(85)
      crear_referencia(86)
      crear_referencia(87)
      crear_referencia(88)
      crear_referencia(89)
      crear_referencia(90)
      crear_referencia(91)
      crear_referencia(92)
      crear_referencia(93)
    end
    if (climatitzacio.caldera_gas_pn_major_70 == true)
      crear_referencia(94)
      crear_referencia(95)
      crear_referencia(96)
      crear_referencia(97)
      crear_referencia(98)
      crear_referencia(99)
      crear_referencia(100)
      crear_referencia(101)
      crear_referencia(102)
      crear_referencia(103)
      crear_referencia(104)
    end
    if (climatitzacio.caldera_biomassa == true)
      crear_referencia(105)
      crear_referencia(106)
      crear_referencia(107)
      crear_referencia(108)
      crear_referencia(109)
      crear_referencia(110)
      crear_referencia(111)
      crear_referencia(112)
      crear_referencia(113)
      crear_referencia(114)
      crear_referencia(115)
      crear_referencia(116)
      crear_referencia(117)
      crear_referencia(118)
      crear_referencia(119)
    end
    if (climatitzacio.caldera_solar_termica == true)
      crear_referencia(120)
      crear_referencia(121)
      crear_referencia(122)
      crear_referencia(123)
      crear_referencia(124)
      crear_referencia(125)
      crear_referencia(126)
      crear_referencia(127)
      crear_referencia(128)
      crear_referencia(129)
      crear_referencia(130)
      crear_referencia(131)
      crear_referencia(132)
      crear_referencia(133)
      crear_referencia(134)
      crear_referencia(135)
      crear_referencia(136)
      crear_referencia(137)
      crear_referencia(138)
      crear_referencia(139)
      crear_referencia(140)
      crear_referencia(141)
      crear_referencia(142)
      crear_referencia(143)
      crear_referencia(144)
    end
    if (climatitzacio.altres_pn_menor_70 == true)
      crear_referencia(145)
      crear_referencia(146)
      crear_referencia(147)
      crear_referencia(148)
      crear_referencia(149)
      crear_referencia(150)
      crear_referencia(151)
      crear_referencia(152)
      crear_referencia(153)
      crear_referencia(154)
      crear_referencia(155)
    end
    if (climatitzacio.altres_pn_major_70 == true)
      crear_referencia(156)
      crear_referencia(157)
      crear_referencia(158)
      crear_referencia(159)
      crear_referencia(160)
      crear_referencia(161)
      crear_referencia(162)
      crear_referencia(163)
      crear_referencia(164)
      crear_referencia(165)
      crear_referencia(166)
    end
    if (climatitzacio.clima_pn_menor_12_autonoms == true)
      crear_referencia(167)
      crear_referencia(168)
    end
    if (climatitzacio.clima_pn_menor_12_torres == true)
      crear_referencia(169)
      crear_referencia(170)
      crear_referencia(171)
      crear_referencia(172)
      crear_referencia(173)
    end
    if (climatitzacio.clima_pn_menor_12_recuperador == true)
      crear_referencia(174)
    end
    if (climatitzacio.clima_pn_12_70_autonoms == true)
      crear_referencia(175)
      crear_referencia(176)
    end
    if (climatitzacio.clima_pn_12_70_torres == true)
      crear_referencia(177)
      crear_referencia(178)
      crear_referencia(179)
      crear_referencia(180)
      crear_referencia(181)
    end
    if (climatitzacio.clima_pn_12_70_recuperador == true)
      crear_referencia(182)
    end
    if (climatitzacio.clima_pn_major_70_autonoms == true)
      crear_referencia(185)
      crear_referencia(186)
    end
    if (climatitzacio.clima_pn_major_70_torres == true)
      crear_referencia(187)
      crear_referencia(188)
      crear_referencia(189)
      crear_referencia(190)
      crear_referencia(191)
    end
    if (climatitzacio.clima_pn_major_70_recuperador == true)
      crear_referencia(192)
    end

    ventilacio = Ventilacio.where(:edifici_id => @edifici.id).last
    if (ventilacio.habitatge_natural_conductes == true)
      crear_referencia(193)
      crear_referencia(194)
    end
    if (ventilacio.habitatge_natural_obertures == true)
      crear_referencia(195)
    end
    if (ventilacio.habitatge_mecanica_conductes == true)
      crear_referencia(196)
      crear_referencia(197)
      crear_referencia(198)
      crear_referencia(199)
      crear_referencia(200)
      crear_referencia(201)
    end
    if (ventilacio.habitatge_mecanica_obertures == true)
      crear_referencia(202)
      crear_referencia(203)
      crear_referencia(204)
    end
    if (ventilacio.habitatge_mecanica_control == true)
      crear_referencia(205)
    end
    if (ventilacio.traster_natural_conductes == true)
      crear_referencia(206)
      crear_referencia(207)
    end
    if (ventilacio.traster_natural_obertures == true)
      crear_referencia(208)
    end
    if (ventilacio.traster_mecanica_conductes == true)
      crear_referencia(209)
      crear_referencia(210)
      crear_referencia(211)
      crear_referencia(212)
      crear_referencia(213)
      crear_referencia(214)
    end
    if (ventilacio.traster_mecanica_obertures == true)
      crear_referencia(215)
      crear_referencia(216)
      crear_referencia(217)
    end
    if (ventilacio.traster_mecanica_control == true)
      crear_referencia(218)
    end
    if (ventilacio.magatzem_natural_conductes == true)
      crear_referencia(219)
      crear_referencia(220)
    end
    if (ventilacio.magatzem_natural_obertures == true)
      crear_referencia(221)
    end
    if (ventilacio.magatzem_mecanica_conductes == true)
      crear_referencia(222)
      crear_referencia(223)
      crear_referencia(224)
      crear_referencia(225)
      crear_referencia(226)
      crear_referencia(227)
    end
    if (ventilacio.magatzem_mecanica_obertures == true)
      crear_referencia(228)
      crear_referencia(229)
      crear_referencia(230)
    end
    if (ventilacio.magatzem_mecanica_control == true)
      crear_referencia(231)
    end
    if (ventilacio.garatge_natural_conductes == true)
      crear_referencia(232)
      crear_referencia(233)
    end
    if (ventilacio.garatge_natural_obertures == true)
      crear_referencia(234)
    end
    if (ventilacio.garatge_mecanica_conductes == true)
      crear_referencia(235)
      crear_referencia(236)
      crear_referencia(237)
      crear_referencia(238)
      crear_referencia(239)
      crear_referencia(240)
    end
    if (ventilacio.garatge_mecanica_obertures == true)
      crear_referencia(241)
      crear_referencia(242)
      crear_referencia(243)
    end
    if (ventilacio.garatge_mecanica_control == true)
      crear_referencia(244)
    end

    incendis = Incendi.where(:edifici_id => @edifici.id).last
    if (incendis.alarma_automatica == true)
      crear_referencia(245)
      crear_referencia(246)
      crear_referencia(247)
      crear_referencia(248)
      crear_referencia(249)
      crear_referencia(250)
      crear_referencia(251)
      crear_referencia(252)
      crear_referencia(253)
      crear_referencia(254)
    end
    if (incendis.alarma_manual == true)
      crear_referencia(255)
      crear_referencia(256)
      crear_referencia(257)
      crear_referencia(258)
      crear_referencia(259)
      crear_referencia(260)
    end
    if (incendis.extintors == true)
      crear_referencia(261)
      crear_referencia(262)
      crear_referencia(263)
      crear_referencia(264)
      crear_referencia(265)
      crear_referencia(266)
    end
    if (incendis.abastiment_aigua == true)
      crear_referencia(267)
      crear_referencia(268)
      crear_referencia(269)
      crear_referencia(270)
      crear_referencia(271)
      crear_referencia(272)
      crear_referencia(273)
      crear_referencia(274)
      crear_referencia(275)
      crear_referencia(276)
      crear_referencia(277)
      crear_referencia(278)
      crear_referencia(279)
    end
    if (incendis.bie == true)
      crear_referencia(280)
      crear_referencia(281)
      crear_referencia(282)
      crear_referencia(283)
      crear_referencia(284)
      crear_referencia(285)
      crear_referencia(286)
      crear_referencia(287)
      crear_referencia(288)
    end
    if (incendis.hidrants == true)
      crear_referencia(289)
      crear_referencia(290)
      crear_referencia(291)
      crear_referencia(292)
      crear_referencia(293)
    end
    if (incendis.ruixadors == true)
      crear_referencia(294)
      crear_referencia(295)
      crear_referencia(296)
      crear_referencia(297)
      crear_referencia(298)
      crear_referencia(299)
    end
    if (incendis.columnes_seques == true)
      crear_referencia(300)
      crear_referencia(301)
      crear_referencia(302)
      crear_referencia(303)
      crear_referencia(304)
      crear_referencia(305)
    end
    if (incendis.parallamps == true)
      crear_referencia(306)
    end

    ascensor = Ascensor.where(:edifici_id => @edifici.id).last
    if (ascensor.habitatge_unifamiliar == true)
      crear_referencia(307)
    end
    if (ascensor.edifici_comunitari == true)
      crear_referencia(308)
    end
    if (ascensor.mes_20_plantes == true)
      crear_referencia(309)
    end
    if (ascensor.altres == true)
      crear_referencia(310)
    end

    telecomunicacions = Telecomunicacio.where(:edifici_id => @edifici.id).last
    if (telecomunicacions.porter_audio == true)
      crear_referencia(314)
    end
    if (telecomunicacions.porter_video == true)
      crear_referencia(315)
    end
    if (telecomunicacions.antena_individual == true)
      crear_referencia(316)
    end
    if (telecomunicacions.antena_colectiva == true)
      crear_referencia(317)
    end
    if (telecomunicacions.parabolica_individual == true)
      crear_referencia(318)
    end
    if (telecomunicacions.parabolica_colectiva == true)
      crear_referencia(319)
    end
    if (telecomunicacions.telefonia == true)
      crear_referencia(320)
    end
    if (telecomunicacions.riti == true)
      crear_referencia(321)
      crear_referencia(322)
    end
    if (telecomunicacions.rits == true)
      crear_referencia(323)
      crear_referencia(324)
    end
    if (telecomunicacions.ritu == true)
      crear_referencia(325)
      crear_referencia(326)
    end
    if (telecomunicacions.ritm == true)
      crear_referencia(327)
      crear_referencia(328)
    end

    especials = Especial.where(:edifici_id => @edifici.id).last
    if (especials.piscina_estructura_obra == true || especials.piscina_estructura_composite == true || especials.piscina_estructura_acer == true)
      crear_referencia(329)
    end
    if (especials.piscina_vores_formigo == true || especials.piscina_vores_pedra == true || especials.piscina_ceramica == true || especials.piscina_resines == true || especials.piscina_porcellana == true)
      crear_referencia(332)
    end
    if (especials.piscina_climatitzacio == true)
      crear_referencia(337)
    end
    if (especials.piscina_iluminacio == true)
      crear_referencia(338)
    end
    if (especials.piscina_purificador == true)
      crear_referencia(339)
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
    referencia.creat_usuari = false
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
      params.require(:referencia).permit(:edifici_id, :operacio_id, :sistema, :creat_usuari)
    end
end
