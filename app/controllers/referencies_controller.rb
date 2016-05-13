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
    referencia_calendaris = ReferenciaCalendari.where(:edifici_id => @edifici.id)
    referencia_calendaris.each do |ref_cal|
      ref_cal.destroy
    end


    fonamentacio = Fonamentacio.where(:edifici_id => @edifici.id).last
    if (fonamentacio.sabates_paredat == true || fonamentacio.sabates_aillades == true || fonamentacio.sabates_continues == true || fonamentacio.llosa == true || fonamentacio.formigo == true || fonamentacio.formigo_armat == true || fonamentacio.pilons == true || fonamentacio.pantalles == true) 
      crear_referencia(1)
    end
    if (fonamentacio.mur_pedra == true || fonamentacio.mur_fabrica_mao == true || fonamentacio.mur_fabrica_bloc == true || fonamentacio.mur_formigo_armat || fonamentacio.mur_pantalla)
      if (fonamentacio.drenatge_perimetral == true)
        crear_referencia(4)
      else
        crear_referencia(3)
      end
      if (fonamentacio.camera_aire == true)
        crear_referencia(5)
      end
      if (fonamentacio.impermeabilitzacio_interior == true)
        crear_referencia(6)
      end
    end
    

    estructura = Estructura.where(:edifici_id => @edifici.id).last
    if (estructura.forjat_sanitari == true || estructura.solera == true)
      crear_referencia(7)
    end
    if (estructura.parets_fabrica_mao_armada == true)
      crear_referencia(8)
    end
    if (estructura.parets_pedra == true)
      crear_referencia(9)
    end
    if (estructura.parets_fabrica_mao == true || estructura.parets_bloc_ceramic == true || estructura.parets_bloc_formigo == true || estructura.pilars_mao == true)
      crear_referencia(10)
    end
    if (estructura.parets_formigo_armat == true)
      crear_referencia(11)
      crear_referencia(12)
    end
    if (estructura.pilars_acer == true)
      crear_referencia(13)
      crear_referencia(14)
      crear_referencia(15)
      crear_referencia(16)
    end
    if (estructura.pilars_formigo_armat == true)
      crear_referencia(17)
      crear_referencia(18)
    end
    if (estructura.parets_entramat_fusta == true || estructura.jasseres_fusta == true || estructura.jasseres_fusta_laminada == true || estructura.forjat_fusta == true || estructura.entrebigat_taulell == true || estructura.encavallada_bigues_fusta == true)
      crear_referencia(19)
      crear_referencia(20)
      crear_referencia(21)
    end
    if (estructura.jasseres_acer == true || estructura.jasseres_acer_formigo == true)
      crear_referencia(22)
      crear_referencia(23)
    end
    if (estructura.jasseres_acer == true || estructura.forjat_metalic == true || estructura.encavallada_bigues_metall == true)
      crear_referencia(24)
      crear_referencia(25)
      crear_referencia(26)
    end
    if (estructura.jasseres_formigo_armat == true || estructura.forjat_formigo_armat == true || estructura.forjat_reticular == true || estructura.llosa_formigo == true || estructura.forjat_inclinat_coberta_formigo == true || estructura.encavallada_bigues_formigo == true)
      crear_referencia(27)
      crear_referencia(28)
    end
    if (estructura.volta_mao == true)
      crear_referencia(29)
    end
    

    tancament = TancamentsVertical.where(:edifici_id => @edifici.id).last
    if (tancament.acabat_revestiment_arrebossat == true || tancament.acabat_pintura_plastica == true || tancament.acabat_pintura_silicat == true || tancament.acabat_revestiment_resines == true || tancament.acabat_pintura_cals == true || tancament.acabat_esgrafiat == true || tancament.acabat_estuc_cals == true || tancament.acabat_morter_monocapa == true || tancament.acabat_aplacat_pedra == true || tancament.acabat_aplacat_enrajolat == true || tancament.acabat_aplacat_plafons == true)
      crear_referencia(30)
      crear_referencia(31)
    end
    if (tancament.paret_pedra == true || tancament.paret_mao_massis == true || tancament.paret_mao_perforat == true || tancament.paret_bloc_morter == true || tancament.paret_bloc_formigo_lleuger == true || tancament.plafons_formigo_massis == true || tancament.plafons_formigo_alveolat == true || tancament.plafons_formigo_aillant == true || tancament.mur_cortina == true)
      crear_referencia(32)
    end
    if (tancament.acabat_revestiment_arrebossat == true)
      crear_referencia(33)
    end
    if (tancament.acabat_pintura_cals == true)
      crear_referencia(34)
    end
    if (tancament.acabat_pintura_plastica == true)
      crear_referencia(35)
    end
    if (tancament.acabat_pintura_silicat == true)
      crear_referencia(36)
    end
    if (tancament.acabat_estuc_cals == true)
      crear_referencia(37)
    end
    if (tancament.acabat_esgrafiat == true)
      crear_referencia(38)
    end
    if (tancament.acabat_revestiment_resines == true)
      crear_referencia(39)
    end
    if (tancament.acabat_aplacat_pedra == true)
      crear_referencia(40)
    end
    if (tancament.acabat_aplacat_enrajolat == true)
      crear_referencia(41)
    end
    if (tancament.acabat_obra_vista == true)
      crear_referencia(42)
    end
    if (tancament.acabat_aplacat_plafons == true)
      crear_referencia(43)
    end
    if (tancament.acabat_aplacat_fixacio_morter == true)
      crear_referencia(44)
    end
    if (tancament.acabat_aplacat_fixacio_acer_galvanitzat == true || tancament.acabat_aplacat_fixacio_acer_inoxidable == true || tancament.acabat_aplacat_fixacio_alumini == true)
      crear_referencia(45)
    end
    if (tancament.parets_mitgeres_enva_ceramica == true || tancament.parets_mitgeres_xapa_acer == true || tancament.parets_mitgeres_arrebossat == true || tancament.parets_mitgeres_pintura_silicat == true || tancament.parets_mitgeres_plaques_fibrociment == true || tancament.parets_mitgeres_pintura_plastica == true || tancament.parets_mitgeres_pintura_cals == true)
      crear_referencia(46)
    end
    if (tancament.parets_mitgeres_enva_ceramica == true)
      crear_referencia(47)
    end
    if (tancament.parets_mitgeres_plaques_fibrociment == true)
      crear_referencia(48)
    end
    if (tancament.parets_mitgeres_arrebossat == true || tancament.parets_mitgeres_pintura_silicat == true || tancament.parets_mitgeres_pintura_plastica == true || tancament.parets_mitgeres_pintura_cals == true)
      crear_referencia(49)
    end
    if (tancament.parets_mitgeres_arrebossat == true)
      crear_referencia(50)
    end
    if (tancament.parets_mitgeres_pintura_cals == true)
      crear_referencia(51)
    end
    if (tancament.parets_mitgeres_pintura_plastica == true)
      crear_referencia(52)
    end
    if (tancament.parets_mitgeres_pintura_silicat == true)
      crear_referencia(53)
    end
    if (tancament.fusteria_fusta == true || tancament.fusteria_acer == true || tancament.fusteria_alumini == true || tancament.fusteria_pvc == true)
      crear_referencia(54)
      crear_referencia(55)
      crear_referencia(56)
      crear_referencia(57)
      crear_referencia(58)
    end
    if (tancament.baranes_ferro_forjat == true)
      crear_referencia(59)
    end
    if (tancament.baranes_perfils_acer == true || tancament.baranes_perfils_alumini == true || tancament.baranes_fusta == true || tancament.baranes_malla_metalica == true || tancament.baranes_vidre_laminat == true)
      crear_referencia(60)
    end
    if (tancament.baranes_perfils_acer == true || tancament.baranes_perfils_alumini == true || tancament.baranes_fusta == true || tancament.baranes_obra == true)
      crear_referencia(61)
    end

    coberta = Coberta.where(:edifici_id => @edifici.id).last
    if (coberta.terrat_transitable == true)
      crear_referencia(62)
    end
    if (coberta.terrat_transitable == true || coberta.terrat_no_transitable == true)     
      crear_referencia(63)
      crear_referencia(64)
    end
    if (coberta.terrat_no_transitable == true)
      crear_referencia(65)
    end
    if (coberta.terrat_acabat_graveta == true)
      crear_referencia(66)
    end
    if (coberta.coberta_teula_arab == true || coberta.coberta_teula_plana == true || coberta.coberta_teula_ciment == true || coberta.coberta_pissarra == true || coberta.coberta_fibrociment == true || coberta.coberta_asfaltica == true || coberta.coberta_xapa_acer == true || coberta.coberta_xapa_coure == true)
      crear_referencia(67)
      crear_referencia(68)
      crear_referencia(69)
      crear_referencia(70)
      crear_referencia(71)
    end
    if (coberta.coberta_pissarra == true)
      crear_referencia(72)
    end
    if (coberta.coberta_xapa_acer == true || coberta.coberta_xapa_coure == true)
      crear_referencia(73)
    end
    if (coberta.terrat_lamina_bituminosa_oxiasfalt == true)
      crear_referencia(74)
    end
    if (coberta.terrat_lamina_bituminosa_betum == true)
      crear_referencia(75)
    end
    if (coberta.terrat_lamina_pvc_resistent == true || coberta.terrat_lamina_pvc_no_resistent == true)
      crear_referencia(76)
    end
    if (coberta.terrat_lamina_cautxu == true)
      crear_referencia(77)
    end
    if (coberta.terrat_lamina_epdm == true)
      crear_referencia(78)
    end
    if (coberta.terrat_lamina_cautxu_sintetic == true)
      crear_referencia(79)
    end
    if (coberta.terrat_lamina_polietile == true)
      crear_referencia(80)
    end
    if (coberta.terrat_lamina_plaques_bituminoses == true)
      crear_referencia(81)
    end
    if (coberta.terrat_lamina_pastes_bituminoses == true)
      crear_referencia(82)
    end
    if (coberta.terrat_junta_dilatacio_cautxu_butil == true || coberta.terrat_junta_dilatacio_cautxu_sintetic == true || coberta.terrat_junta_dilatacio_emulsions_bituminoses == true || coberta.terrat_junta_dilatacio_silicona == true)
      crear_referencia(83)
      crear_referencia(84)
    end
    if (coberta.terrat_acabat_enrajolat == true)
      crear_referencia(85)
      crear_referencia(86)
    end
    if (coberta.terrat_acabat_lloses_flotants == true)
      crear_referencia(87)
    end
    if (coberta.lluernes_practicables == true)
      crear_referencia(88)
    end
    if (coberta.lluernes_fixes == true || coberta.lluernes_practicables == true)
      crear_referencia(89)
      crear_referencia(90)
      crear_referencia(91)
    end
    if (coberta.lluernes_entramat_acer == true)
      crear_referencia(92)
    end

    particions = Particio.where(:edifici_id => @edifici.id).last
    if (particions.envans_ceramica == true || particions.envans_cartro_guix == true || particions.envans_bloc_formigo == true || particions.envans_paves == true || particions.envans_fusta == true || particions.envans_plaques_alveolades == true)
      crear_referencia(93)
    end
    if (particions.celras_fibres_vegetals == true || particions.celras_fibres_minerals == true || particions.celras_plaques_guix == true || particions.celras_metalic == true || particions.celras_fusta == true)
      crear_referencia(94)
    end
    if (particions.acabat_textil == true)
      crear_referencia(95)
    end
    if (particions.acabat_pintat == true)
      crear_referencia(96)
    end
    if (particions.acabat_estuc == true)
      crear_referencia(97)
    end
    if (particions.acabat_aplacat_ceramica == true)
      crear_referencia(98)
    end
    if (particions.acabat_aplacat_pedra == true)
      crear_referencia(99)
    end
    if (particions.acabat_empaperat == true)
      crear_referencia(100)
    end
    if (particions.acabat_fusta == true)
      crear_referencia(101)
    end
    if (particions.acabat_taulell_fusta == true)
      crear_referencia(102)
      crear_referencia(103)
    end
    if (particions.acabat_suro == true)
      crear_referencia(104)
    end
    if (particions.acabat_sintetic == true)
      crear_referencia(105)
    end
    if (particions.paviment_terratzo == true)
      crear_referencia(106)
    end
    if (particions.paviment_mosaic_hidraulic == true)
      crear_referencia(107)
    end
    if (particions.paviment_ceramica_natural == true)
      crear_referencia(108)
    end
    if (particions.paviment_suro == true)
      crear_referencia(109)
    end
    if (particions.paviment_parquet_encolat == true || particions.paviment_parquet_flotant == true || particions.paviment_parquet_llates == true)
      crear_referencia(110)
    end
    if (particions.paviment_moqueta == true)
      crear_referencia(111)
      crear_referencia(112)
    end
    if (particions.porta_fulla_massissa_fusta == true || particions.porta_fulla_aplacat_fusta == true || particions.porta_fulla_vidre == true || particions.porta_fulla_alumini == true || particions.porta_fulla_ferro == true)
      crear_referencia(113)
      crear_referencia(114)
    end
    if (particions.porta_acabat_pintat == true)
      crear_referencia(115)
    end
    if (particions.porta_acabat_lacat == true)
      crear_referencia(116)
    end
    if (particions.porta_acabat_envernissat == true)
      crear_referencia(117)
    end
    if (particions.porta_ferratge_llauto == true)
      crear_referencia(118)
    end
    if (particions.porta_ferratge_acer_llautonat == true)
      crear_referencia(119)
    end
    if (particions.porta_ferratge_acer_niquelat == true)
      crear_referencia(120)
    end
    if (particions.porta_ferratge_acer_inoxidable == true)
      crear_referencia(121)
    end
    if (particions.barana_ferro_forjat == true || particions.barana_perfils_acer == true || particions.barana_perfils_alumini == true || particions.barana_fusta == true || particions.barana_pvc == true || particions.barana_vidre_laminat == true || particions.barana_metacrilat == true)
      crear_referencia(122)
      crear_referencia(123)
    end

    sanejament = Sanejament.where(:edifici_id => @edifici.id).last
    if (sanejament.si_sistema_evacuacio == true)
      if (coberta.terrat_transitable == true)
        crear_referencia(124)
      else
        crear_referencia(125)
      end
      crear_referencia(126)
      crear_referencia(127)
      crear_referencia(128)
      crear_referencia(131)
      if (sanejament.colectors_vistos == true)
        crear_referencia(129)
        crear_referencia(133)
      end
      if (sanejament.bomba_elevacio == true)
        crear_referencia(130)
      end
      if (sanejament.separador_greixos == true)
        crear_referencia(132)
      end
      if (sanejament.fosa_septica == true)
        crear_referencia(134)
      end
    end

    aigua = Aigua.where(:edifici_id => @edifici.id).last
    if (aigua.grup_pressio == true)
      crear_referencia(135)
    end

    electricitat = Electricitat.where(:edifici_id => @edifici.id).last
    if (electricitat.enllumenat_comunitari == true)
      crear_referencia(140)
      crear_referencia(141)
    end
    if (electricitat.mes_100k == true)
      crear_referencia(136)
    end
    if (electricitat.connexio_terra == true)
      crear_referencia(138)
      crear_referencia(139)
    end
    if (electricitat.centre_transformacio == true)
      crear_referencia(142)
    end
    if (electricitat.fotovoltaica == true)
      crear_referencia(143)
      crear_referencia(144)
      crear_referencia(145)
      crear_referencia(146)
      crear_referencia(147)
      crear_referencia(148)
    end
    if (electricitat.comptador_unic == true || electricitat.comptadors_individuals_habitatge == true || electricitat.comptadors_centralitzats == true)
      crear_referencia(137)
    end
    # Generem les operacions de manteniment d'il·luminació en terciari en tots els casos. Sempre hi ha il·luminació.
    if @edifici.tipus_edifici == "nou_terciari"
      crear_referencia(536)
      crear_referencia(537)
      crear_referencia(538)
      crear_referencia(539)
      crear_referencia(540)
      crear_referencia(541)
      crear_referencia(542)
      crear_referencia(543)
      crear_referencia(544)
      crear_referencia(545)
      crear_referencia(546)
    end

    gas = Ga.where(:edifici_id => @edifici.id).last
    if (gas.instalacio_gas == true)
      crear_referencia(149)
    end
    if (gas.diposit_aire_lliure == true || gas.diposit_enterrat == true)
      crear_referencia(150)
      crear_referencia(151)
    end
    if (gas.diposit_enterrat == true)
      crear_referencia(152)
    end


    climatitzacio = Climatitzacio.where(:edifici_id => @edifici.id).last
    # Evaluem si es tracta d'edifici residencial o terciari
    if @edifici.tipus_edifici != "nou_terciari"
      if (climatitzacio.escalfador_pn_menor_24 == true)
        crear_referencia(153)
        crear_referencia(154)
        crear_referencia(155)
      end
      if (climatitzacio.escalfador_pn_24_70 == true)
        crear_referencia(156)
        crear_referencia(157)
        crear_referencia(158)
      end
      if (climatitzacio.escalfador_pn_major_70 == true)
        crear_referencia(159)
        crear_referencia(160)
        crear_referencia(161)
      end
      if (climatitzacio.caldera_gas_pn_menor_70 == true)
        crear_referencia(162)
        crear_referencia(163)
        crear_referencia(164)
        crear_referencia(165)
        crear_referencia(166)
        crear_referencia(167)
        crear_referencia(168)
        crear_referencia(169)
        crear_referencia(170)
        crear_referencia(171)
        crear_referencia(172)
      end
      if (climatitzacio.caldera_gas_pn_major_70 == true)
        crear_referencia(173)
        crear_referencia(174)
        crear_referencia(175)
        crear_referencia(176)
        crear_referencia(177)
        crear_referencia(178)
        crear_referencia(179)
        crear_referencia(180)
        crear_referencia(181)
        crear_referencia(182)
        crear_referencia(183)
      end
      if (climatitzacio.caldera_biomassa == true)
        crear_referencia(184)
        crear_referencia(185)
        crear_referencia(186)
        crear_referencia(187)
        crear_referencia(188)
        crear_referencia(189)
        crear_referencia(190)
        crear_referencia(191)
        crear_referencia(192)
        crear_referencia(193)
        crear_referencia(194)
        crear_referencia(195)
        crear_referencia(196)
        crear_referencia(197)
        crear_referencia(198)
      end
      if (climatitzacio.caldera_solar_termica == true)
        crear_referencia(199)
        crear_referencia(200)
        crear_referencia(201)
        crear_referencia(202)
        crear_referencia(203)
        crear_referencia(204)
        crear_referencia(205)
        crear_referencia(206)
        crear_referencia(207)
        crear_referencia(208)
        crear_referencia(209)
        crear_referencia(210)
        crear_referencia(211)
        crear_referencia(212)
        crear_referencia(213)
        crear_referencia(214)
        crear_referencia(215)
        crear_referencia(216)
        crear_referencia(217)
        crear_referencia(218)
        crear_referencia(219)
        crear_referencia(220)
        crear_referencia(221)
        crear_referencia(222)
        crear_referencia(223)
      end
      if (climatitzacio.altres_pn_menor_70 == true)
        crear_referencia(224)
        crear_referencia(225)
        crear_referencia(226)
        crear_referencia(227)
        crear_referencia(228)
        crear_referencia(229)
        crear_referencia(230)
        crear_referencia(231)
        crear_referencia(232)
        crear_referencia(233)
        crear_referencia(234)
      end
      if (climatitzacio.altres_pn_major_70 == true)
        crear_referencia(235)
        crear_referencia(236)
        crear_referencia(237)
        crear_referencia(238)
        crear_referencia(239)
        crear_referencia(240)
        crear_referencia(241)
        crear_referencia(242)
        crear_referencia(243)
        crear_referencia(244)
        crear_referencia(245)
      end
      if (climatitzacio.clima_pn_menor_12_autonoms == true)
        crear_referencia(246)
        crear_referencia(247)
      end
      if (climatitzacio.clima_pn_menor_12_torres == true)
        crear_referencia(248)
        crear_referencia(249)
        crear_referencia(250)
        crear_referencia(251)
        crear_referencia(252)
      end
      if (climatitzacio.clima_pn_menor_12_recuperador == true)
        crear_referencia(253)
      end
      if (climatitzacio.clima_pn_12_70_autonoms == true)
        crear_referencia(254)
        crear_referencia(255)
      end
      if (climatitzacio.clima_pn_12_70_torres == true)
        crear_referencia(256)
        crear_referencia(257)
        crear_referencia(258)
        crear_referencia(259)
        crear_referencia(260)
      end
      if (climatitzacio.clima_pn_12_70_recuperador == true)
        crear_referencia(261)
      end
      if (climatitzacio.clima_pn_major_70_autonoms == true)
        crear_referencia(264)
        crear_referencia(265)
      end
      if (climatitzacio.clima_pn_major_70_torres == true)
        crear_referencia(266)
        crear_referencia(267)
        crear_referencia(268)
        crear_referencia(269)
        crear_referencia(270)
      end
      if (climatitzacio.clima_pn_major_70_recuperador == true)
        crear_referencia(271)
      end
    end
    if @edifici.tipus_edifici == "nou_terciari"
      if (climatitzacio.escalfador_pn_menor_24 == true)
        crear_referencia(419)
        crear_referencia(420)
        crear_referencia(421)
      end
      if (climatitzacio.escalfador_pn_24_70 == true)
        crear_referencia(422)
        crear_referencia(423)
        crear_referencia(424)
      end
      if (climatitzacio.escalfador_pn_major_70 == true)
        crear_referencia(425)
        crear_referencia(426)
        crear_referencia(427)
      end
      if (climatitzacio.caldera_gas_pn_menor_70 == true)
        crear_referencia(428)
        crear_referencia(429)
        crear_referencia(430)
        crear_referencia(431)
        crear_referencia(432)
        crear_referencia(433)
        crear_referencia(434)
        crear_referencia(435)
        crear_referencia(436)
        crear_referencia(437)
        crear_referencia(438)
      end
      if (climatitzacio.caldera_gas_pn_major_70 == true)
        crear_referencia(439)
        crear_referencia(440)
        crear_referencia(441)
        crear_referencia(442)
        crear_referencia(443)
        crear_referencia(444)
        crear_referencia(445)
        crear_referencia(446)
        crear_referencia(447)
        crear_referencia(448)
        crear_referencia(449)
      end
      if (climatitzacio.caldera_biomassa == true)
        crear_referencia(450)
        crear_referencia(451)
        crear_referencia(452)
        crear_referencia(453)
        crear_referencia(454)
        crear_referencia(455)
        crear_referencia(456)
        crear_referencia(457)
        crear_referencia(458)
        crear_referencia(459)
        crear_referencia(460)
        crear_referencia(461)
        crear_referencia(462)
        crear_referencia(463)
        crear_referencia(464)
      end
      if (climatitzacio.caldera_solar_termica == true)
        crear_referencia(465)
        crear_referencia(466)
        crear_referencia(467)
        crear_referencia(468)
        crear_referencia(469)
        crear_referencia(470)
        crear_referencia(471)
        crear_referencia(472)
        crear_referencia(473)
        crear_referencia(474)
        crear_referencia(475)
        crear_referencia(476)
        crear_referencia(477)
        crear_referencia(478)
        crear_referencia(479)
        crear_referencia(480)
        crear_referencia(481)
        crear_referencia(482)
        crear_referencia(483)
        crear_referencia(484)
        crear_referencia(485)
        crear_referencia(486)
        crear_referencia(487)
        crear_referencia(488)
        crear_referencia(489)
      end
      if (climatitzacio.altres_pn_menor_70 == true)
        crear_referencia(490)
        crear_referencia(491)
        crear_referencia(492)
        crear_referencia(493)
        crear_referencia(494)
        crear_referencia(495)
        crear_referencia(496)
        crear_referencia(497)
        crear_referencia(498)
        crear_referencia(499)
        crear_referencia(500)
      end
      if (climatitzacio.altres_pn_major_70 == true)
        crear_referencia(501)
        crear_referencia(502)
        crear_referencia(503)
        crear_referencia(504)
        crear_referencia(505)
        crear_referencia(506)
        crear_referencia(507)
        crear_referencia(508)
        crear_referencia(509)
        crear_referencia(510)
        crear_referencia(511)
      end
      if (climatitzacio.clima_pn_menor_12_autonoms == true)
        crear_referencia(512)
        crear_referencia(513)
      end
      if (climatitzacio.clima_pn_menor_12_torres == true)
        crear_referencia(514)
        crear_referencia(515)
        crear_referencia(516)
      end
      if (climatitzacio.clima_pn_menor_12_recuperador == true)
        crear_referencia(517)
      end
      if (climatitzacio.clima_pn_12_70_autonoms == true)
        crear_referencia(518)
        crear_referencia(519)
      end
      if (climatitzacio.clima_pn_12_70_torres == true)
        crear_referencia(520)
        crear_referencia(521)
        crear_referencia(522)
      end
      if (climatitzacio.clima_pn_12_70_recuperador == true)
        crear_referencia(523)
      end
      if (climatitzacio.clima_pn_major_70_autonoms == true)
        crear_referencia(524)
        crear_referencia(525)
      end
      if (climatitzacio.clima_pn_major_70_torres == true)
        crear_referencia(526)
        crear_referencia(527)
        crear_referencia(528)
      end
      if (climatitzacio.clima_pn_major_70_recuperador == true)
        crear_referencia(529)
      end
    end

    ventilacio = Ventilacio.where(:edifici_id => @edifici.id).last
      if @edifici.tipus_edifici != "nou_terciari"
      if (ventilacio.habitatge_natural_conductes == true)
        crear_referencia(272)
        crear_referencia(273)
      end
      if (ventilacio.habitatge_natural_obertures == true)
        crear_referencia(274)
      end
      if (ventilacio.habitatge_mecanica_conductes == true)
        crear_referencia(275)
        crear_referencia(276)
        crear_referencia(277)
        crear_referencia(278)
        crear_referencia(279)
        crear_referencia(280)
      end
      if (ventilacio.habitatge_mecanica_obertures == true)
        crear_referencia(281)
        crear_referencia(282)
        crear_referencia(283)
      end
      if (ventilacio.habitatge_mecanica_control == true)
        crear_referencia(284)
      end
      if (ventilacio.traster_natural_conductes == true)
        crear_referencia(285)
        crear_referencia(286)
      end
      if (ventilacio.traster_natural_obertures == true)
        crear_referencia(287)
      end
      if (ventilacio.traster_mecanica_conductes == true)
        crear_referencia(288)
        crear_referencia(289)
        crear_referencia(290)
        crear_referencia(291)
        crear_referencia(292)
        crear_referencia(293)
      end
      if (ventilacio.traster_mecanica_obertures == true)
        crear_referencia(294)
        crear_referencia(295)
        crear_referencia(296)
      end
      if (ventilacio.traster_mecanica_control == true)
        crear_referencia(297)
      end
      if (ventilacio.magatzem_natural_conductes == true)
        crear_referencia(298)
        crear_referencia(299)
      end
      if (ventilacio.magatzem_natural_obertures == true)
        crear_referencia(300)
      end
      if (ventilacio.magatzem_mecanica_conductes == true)
        crear_referencia(301)
        crear_referencia(302)
        crear_referencia(303)
        crear_referencia(304)
        crear_referencia(305)
        crear_referencia(306)
      end
      if (ventilacio.magatzem_mecanica_obertures == true)
        crear_referencia(307)
        crear_referencia(308)
        crear_referencia(309)
      end
      if (ventilacio.magatzem_mecanica_control == true)
        crear_referencia(310)
      end
      if (ventilacio.garatge_natural_conductes == true)
        crear_referencia(311)
        crear_referencia(312)
      end
      if (ventilacio.garatge_natural_obertures == true)
        crear_referencia(313)
      end
      if (ventilacio.garatge_mecanica_conductes == true)
        crear_referencia(314)
        crear_referencia(315)
        crear_referencia(316)
        crear_referencia(317)
        crear_referencia(318)
        crear_referencia(319)
      end
      if (ventilacio.garatge_mecanica_obertures == true)
        crear_referencia(320)
        crear_referencia(321)
        crear_referencia(322)
      end
      if (ventilacio.garatge_mecanica_control == true)
        crear_referencia(323)
      end
    end
    if @edifici.tipus_edifici == "nou_terciari"
      if (ventilacio.terciari_monozona == true || ventilacio.terciari_multizona == true || ventilacio.terciari_hibrid == true)
        crear_referencia(530)
        crear_referencia(531)
        crear_referencia(532)
        crear_referencia(533)
        crear_referencia(534)
        crear_referencia(535)
      end
    end

    incendis = Incendi.where(:edifici_id => @edifici.id).last
    if (incendis.alarma_automatica == true)
      crear_referencia(324)
      crear_referencia(325)
      crear_referencia(326)
      crear_referencia(327)
      crear_referencia(328)
      crear_referencia(329)
      crear_referencia(330)
      crear_referencia(331)
      crear_referencia(332)
      crear_referencia(333)
    end
    if (incendis.alarma_manual == true)
      crear_referencia(334)
      crear_referencia(335)
      crear_referencia(336)
      crear_referencia(337)
      crear_referencia(338)
      crear_referencia(339)
    end
    if (incendis.extintors == true)
      crear_referencia(340)
      crear_referencia(341)
      crear_referencia(342)
      crear_referencia(343)
      crear_referencia(344)
      crear_referencia(345)
    end
    if (incendis.abastiment_aigua == true)
      crear_referencia(346)
      crear_referencia(347)
      crear_referencia(348)
      crear_referencia(349)
      crear_referencia(350)
      crear_referencia(351)
      crear_referencia(352)
      crear_referencia(353)
      crear_referencia(354)
      crear_referencia(355)
      crear_referencia(356)
      crear_referencia(357)
      crear_referencia(358)
    end
    if (incendis.bie == true)
      crear_referencia(359)
      crear_referencia(360)
      crear_referencia(361)
      crear_referencia(362)
      crear_referencia(363)
      crear_referencia(364)
      crear_referencia(365)
      crear_referencia(366)
      crear_referencia(367)
    end
    if (incendis.hidrants == true)
      crear_referencia(368)
      crear_referencia(369)
      crear_referencia(370)
      crear_referencia(371)
      crear_referencia(372)
    end
    if (incendis.ruixadors == true)
      crear_referencia(373)
      crear_referencia(374)
      crear_referencia(375)
      crear_referencia(376)
      crear_referencia(377)
      crear_referencia(378)
    end
    if (incendis.columnes_seques == true)
      crear_referencia(379)
      crear_referencia(380)
      crear_referencia(381)
      crear_referencia(382)
      crear_referencia(383)
      crear_referencia(384)
    end
    if (incendis.parallamps == true)
      crear_referencia(385)
    end

    ascensor = Ascensor.where(:edifici_id => @edifici.id).last
    if (ascensor.habitatge_unifamiliar == true)
      crear_referencia(386)
    end
    if (ascensor.edifici_comunitari == true)
      crear_referencia(387)
    end
    if (ascensor.mes_20_plantes == true)
      crear_referencia(388)
      crear_referencia(391)
    end
    if (ascensor.altres == true)
      crear_referencia(389)
    end
    if (ascensor.habitatge_unifamiliar == true || ascensor.edifici_comunitari == true || ascensor.altres == true)
      crear_referencia(392)
    end

    telecomunicacions = Telecomunicacio.where(:edifici_id => @edifici.id).last
    if (telecomunicacions.porter_audio == true)
      crear_referencia(393)
    end
    if (telecomunicacions.porter_video == true)
      crear_referencia(394)
    end
    if (telecomunicacions.antena_individual == true)
      crear_referencia(395)
    end
    if (telecomunicacions.antena_colectiva == true)
      crear_referencia(396)
    end
    if (telecomunicacions.parabolica_individual == true)
      crear_referencia(397)
    end
    if (telecomunicacions.parabolica_colectiva == true)
      crear_referencia(398)
    end
    if (telecomunicacions.telefonia == true)
      crear_referencia(399)
    end
    if (telecomunicacions.riti == true)
      crear_referencia(400)
      crear_referencia(401)
    end
    if (telecomunicacions.rits == true)
      crear_referencia(402)
      crear_referencia(403)
    end
    if (telecomunicacions.ritu == true)
      crear_referencia(404)
      crear_referencia(405)
    end
    if (telecomunicacions.ritm == true)
      crear_referencia(406)
      crear_referencia(407)
    end

    especials = Especial.where(:edifici_id => @edifici.id).last
    if (especials.piscina_estructura_obra == true || especials.piscina_estructura_composite == true || especials.piscina_estructura_acer == true)
      crear_referencia(408)
    end
    if (especials.piscina_vores_formigo == true || especials.piscina_vores_pedra == true || especials.piscina_ceramica == true || especials.piscina_resines == true || especials.piscina_porcellana == true)
      crear_referencia(411)
    end
    if (especials.piscina_climatitzacio == true)
      crear_referencia(416)
    end
    if (especials.piscina_iluminacio == true)
      crear_referencia(417)
    end
    if (especials.piscina_purificador == true)
      crear_referencia(418)
    end

    # Creem el calendari d'operacions
    crear_calendari

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

  def crear_calendari
    referencies = Referencia.where(:edifici_id => @edifici.id)
    any_inici = Time.now.year + 1
    any_fi = any_inici + 20
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      # Comprovo no posar operacions massa freqüents, així apareixeran les operacions que siguin dos cops l'any o menys.
      if operacio.periodicitat > 0.4
        any = any_inici
        while any < any_fi do
          referencia_calendari = ReferenciaCalendari.new
          referencia_calendari.edifici_id = @edifici.id
          referencia_calendari.operacio_id = referencia.operacio_id
          referencia_calendari.any = any
          referencia_calendari.save
          any = any + operacio.periodicitat
        end
      end
    end
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
