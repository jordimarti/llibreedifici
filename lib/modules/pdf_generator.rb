module PdfGenerator

	def titol_pdf(sistema)
  	text_titol = '<div class="salt-pagina"></div><p class="titol-sistema">' + sistema + '</p>'
  	return text_titol
  end

  def descripcio_pdf(sistema, sistema_usuari)
  	sistema_seleccionat = sistema.where(:edifici_id => @edifici.id).last
    #Inici del llistat
    llistat_elements = '<p class="apartat-sistema">Descripció constructiva:</p><ul>'
    sistema_seleccionat.attributes.each_pair do |name, value|
      if (value == true)
        element = ElementPredefinit.where(:nom_element => name).last
        puts "Element Predefinit"
        puts element.id
        puts element.nom_element
        #Afegim els elements del llistat
        llistat_elements = llistat_elements + '<li class="li-impressio">' + element.descripcio_ca + '</li>'
      end
    end
    #Introduïm els elements definits per l'usuari
    elements_usuari = Element.where(:edifici_id => @edifici.id, :sistema_element => sistema_usuari)
    elements_usuari.each do |element_usuari|
      llistat_elements = llistat_elements + '<li class="li-impressio">' + element_usuari.nom_element + '</li>'
    end
    #A estructura hi ha les sobrecàrregues
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_habitatges != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en habitatges: ' + @edifici.estructura.sobrecarregues_habitatges.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_zones_comuns != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en zones comuns: ' + @edifici.estructura.sobrecarregues_zones_comuns.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_coberta_inclinada != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en coberta inclinada: ' + @edifici.estructura.sobrecarregues_coberta_inclinada.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_coberta_plana != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en coberta plana: ' + @edifici.estructura.sobrecarregues_coberta_plana.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_locals != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en locals: ' + @edifici.estructura.sobrecarregues_locals.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_garatges != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en garatges: ' + @edifici.estructura.sobrecarregues_garatges.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'estructura' && @edifici.estructura.sobrecarregues_trasters != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrregues admissibles en trasters: ' + @edifici.estructura.sobrecarregues_trasters.to_s + ' kg/m<sup>2</sup></li>'
    end
    #A tancaments hi ha les sobrecàrregues
    if sistema_usuari == 'tancaments' && @edifici.tancaments_vertical.sobrecarrega_repartida_balco != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrrega repartida del balcó: ' + @edifici.tancaments_vertical.sobrecarrega_repartida_balco.to_s + ' kg/m<sup>2</sup></li>'
    end
    if sistema_usuari == 'tancaments' && @edifici.tancaments_vertical.sobrecarrega_linial_vora_balco != nil
      llistat_elements = llistat_elements + '<li class="li-impressio">Sobrecàrrega linial actuant en la vora de la balconada: ' + @edifici.tancaments_vertical.sobrecarrega_linial_vora_balco.to_s + ' kg/m</li>'
    end
    #Tanquem el llistat
    llistat_elements = llistat_elements + '</ul>'
    return llistat_elements
  end

  def instruccions_pdf(sistema)
  	case sistema
  	when 'fonamentacio'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Cal evitar qualsevol tipus de canvi en el sistema de càrrega de les diferents parts de l’edifici. Si desitgeu introduir modificacions o qualsevol canvi d’ús dins l’edifici consulteu al vostre Tècnic de Capçalera.</p>
<p class="p-impressio">Les lesions (esquerdes, desploms) als fonaments no són apreciables directament i es detecten a partir de les que apareixen a d’altres elements constructius (parets, sostres, etc.). En aquests casos, fa falta que el Tècnic de Capçalera faci un informe sobre les lesions detectades, en determini la gravetat i, si escau, la necessitat d’intervenció.</p>
<p class="p-impressio">Les alteracions d’importància efectuades als terrenys propers, com ara: noves construccions, realització de pous, túnels, vies, carreteres o reblerts de terres poden afectar la fonamentació de l’edifici. Si durant la realització dels treballs es detecten lesions, s’hauran d’estudiar i, si és el cas, es podrà exigir la seva reparació.</p>
<p class="p-impressio">Els corrents subterranis d’aigua natural i les fuites de conduccions d’aigua o de desguassos poden ser causa d’alteracions del terreny i de descalçaments de la fonamentació. Aquests descalçaments poden produir un assentament de la zona afectada, que pot transformar-se en deterioraments importants a la resta de l’estructura. Per aquest motiu, és primordial eliminar ràpidament qualsevol tipus d’humitat que provingui del subsòl. </p>
<p class="p-impressio">Després de pluges fortes s’observaran les possibles humitats i el bon funcionament de les perforacions de drenatge i desguàs.</p> '

  	when 'estructura'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Les humitats persistents als elements estructurals tenen un efecte nefast sobre la conservació de l’estructura. Cal reparar-les immediatament.</p>
<p class="p-impressio">Si s’han de penjar objectes (quadres, prestatgeries, mobles o lluminàries) als elements estructurals cal utilitzar tacs i cargols adequats per al material de base.</p>
<p class="p-impressio">Els elements que formen part de l’estructura de l’edifici, parets de càrrega incloses, no es poden alterar sense el control del Tècnic de Capçalera. Aquesta prescripció inclou la realització de regates a les parets de càrrega i l’obertura de passos per a la redistribució d’espais interiors.</p>
<p class="p-impressio">Durant la vida útil de l’edifici poden aparèixer símptomes de lesions a l’estructura o als elements en contacte amb ella. En general, aquests defectes poden tenir caràcter greu. En aquests casos, és necessari que el vostre Tècnic de Capçalera analitzi les lesions detectades, en determini la importància i, si escau, decideixi la necessitat d’una intervenció.</p>
<p class="p-impressio">Relació orientativa de símptomes de lesions amb repercussió possible sobre l’estructura:
<ul>
<li class="li-impressio">Deformacions: desploms de parets, façanes i pilars.</li>
<li class="li-impressio">Fissures i esquerdes: a parets, façanes i pilars.</li>
<li class="li-impressio">Taques d\'òxid en elements metàl·lics. </li>
</ul>
</p>'

  	when 'tancaments'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Les façanes separen l’habitatge de l’ambient exterior, per aquest motiu, han de complir importants exigències d’aïllament respecte del fred o la calor, el soroll, l’entrada d’aire i d’humitat, la resistència, la seguretat al robatori, etc.</p>
<p class="p-impressio">La façana constitueix la imatge externa de la casa i dels seus ocupants, conforma el carrer i, per tant, configura l’aspecte de la nostra ciutat. Per això, no pot alterar-se (tancar balcons amb vidre, obrir noves obertures, instal·lar tendals o rètols no apropiats) sense tenir en compte les ordenances municipals i l’aprovació de la Comunitat de Propietaris.</p> 
<p class="p-impressio">Els acabats de la façana acostumen a ser uns dels punts més fràgils de l’edifici ja que estan en contacte directe amb la intempèrie. D’altra banda, el que inicialment potser només és brutícia o una degradació de la imatge estètica de la façana, es pot convertir en un perill, ja que qualsevol despreniment cauria directament sobre el carrer. </p>
<p class="p-impressio">Els aplacats de pedra natural s’embruten amb molta facilitat depenent de la porositat de la pedra. Consulteu al vostre Tècnic de Capçalera la possibilitat d’aplicar un producte protector incolor. </p>
<p class="p-impressio">Les parets mitgeres són aquelles que separen l’edifici dels edificis veïns. Quan no hi hagi edificis veïns o siguin més baixos, les mitgeres quedaran a la vista i hauran d’estar protegides com si fossin façanes. </p>
<p class="p-impressio">Als balcons i les galeries no s’han de col·locar càrregues pesades, com ara jardineres o materials emmagatzemats. També s’hauria d’evitar que l’aigua que s’utilitza per regar regalimi per la façana. </p>
<p class="p-impressio">Les finestres i balcons exteriors són elements comuns de l’edifici, tot i que el seu ús sigui majoritàriament privat. Qualsevol modificació de la seva imatge exterior (incloent-hi el canvi de perfileria) haurà de ser aprovada per la Comunitat de Propietaris. Tanmateix, la neteja i el manteniment correspon als usuaris dels habitatges.</p>
<p class="p-impressio">No es recolzaran, sobre les finestres i balcons, elements de subjecció de bastides, politges per aixecar càrregues o mobles, mecanismes de neteja exteriors o d’altres objectes que els puguin malmetre.</p>
<p class="p-impressio">No s’han de donar cops forts a les finestres. D’altra banda, les finestres poden aconseguir una alta estanquitat a l’aire i al soroll amb la col·locació de ribets especialment concebuts per aquesta finalitat.</p>
<p class="p-impressio">Els vidres s’hauran de netejar amb aigua sabonosa, preferentment tèbia, i posteriorment s’assecaran. No s’han de fregar amb draps secs, ja que el vidre es ratllaria. </p>
<p class="p-impressio">A les persianes enrotllables de PVC, s’ha d’evitar forçar les lamel·les quan perdin l’horitzontalitat o es quedin encallades a les guies. S’ha de netejar amb detergents no alcalins i aigua calenta. Cal utilitzar un drap suau o una esponja. </p>
<p class="p-impressio">Una manca d’aïllament tèrmic pot ser la causa de l’existència d’humitats de condensació. El Tècnic de Capçalera haurà d’analitzar els símptomes adequadament per tal de determinar possibles defectes a l’aïllament tèrmic.</p>
<p class="p-impressio">Si l’aïllament tèrmic es mulla, perd la seva efectivitat. Per tant, s’ha d’evitar qualsevol tipus d’humitat que el pugui afectar.</p>
<p class="p-impressio">El soroll es transmet per l’aire o per mitjà dels materials de l’edifici. Pot provenir del carrer o de l’interior de la casa. El soroll del carrer es pot reduir mitjançant finestres amb doble vidre o dobles finestres. El soroll de les persones es pot reduir amb la col·locació de materials aïllants o absorbents acústics a parets i sostres. </p>
<p class="p-impressio">Per a les reposicions dels elements que tinguin una durada més curta que la pròpia façana (junts, proteccions, etc.) o dels tancaments de vidre, s\'utilitzaran productes idèntics als existents o de característiques equivalents que no alterin les seves prestacions inicials.</p>
<p class="p-impressio">Els despreniments d\'elements de la façana, són un risc, tant pels usuaris com pels vianants. </p>
<p class="p-impressio">És responsabilitat de l\'usuari, que, quan hi hagi símptomes de degradacions, bufats i/o elements trencats a les façanes, avisar ràpidament als responsables de manteniment de l\'edifici perquè es prenguin les mesures oportunes. En cas de perill imminent cal avisar al Servei de Bombers.</p>'

  	when 'cobertes'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Cobertes planes:</p>
<p class="p-impressio">Les cobertes planes s’han de mantenir netes i sense herbes, especialment les buneres, les canals i els aiguafons. És preferible no col·locar jardineres a prop dels desguassos o bé que estiguin elevades del sòl per permetre el pas de l’aigua.</p>
<p class="p-impressio">Aquest tipus de coberta només ha d’utilitzar-se per a l’ús a què hagi estat projectada. En aquest sentit, s’evitarà l’emmagatzematge de materials, mobles, etc., i l’abocament de productes químics agressius com ara olis, dissolvents o lleixiu.</p>
<p class="p-impressio">Si a la coberta s’hi instal·len noves antenes, equips d’aire condicionat o, en general, aparells que requereixin ser fixats, la subjecció no ha d’afectar la impermeabilització.</p>
<p class="p-impressio">Tampoc no s’han d’utilitzar com a punts d’ancoratge de tensors, de baranes metàl·liques o d’obra, ni de conductes d’evacuació de fums existents, llevat que el Tècnic de Capçalera ho autoritzi. Si aquestes noves instal·lacions precisen d’un manteniment periòdic, es preveuran al seu entorn les proteccions adequades. </p>
<p class="p-impressio">En cas que s’observin humitats als pisos sota coberta, caldrà controlar-les, ja que poden tenir un efecte negatiu sobre els elements estructurals. </p>
<p class="p-impressio">Cal procurar, sempre que sigui possible, no caminar per sobre de les cobertes planes no transitables. Quan sigui necessari trepitjar-les s’ha d’anar amb molt de compte per no produir desperfectes. El personal d’inspecció, conservació o reparació estarà proveït de sabates de sola tova. </p>
<p class="p-impressio">Cobertes amb pendent:</p>
<p class="p-impressio">Les cobertes s’han de mantenir netes i sense herbes, especialment les buneres, les canals i els aiguafons. S’ha de procurar, sempre que sigui possible, no trepitjar les cobertes en pendent. Quan s\'hi transiti cal anar amb molt de compte per no produir desperfectes.</p>
<p class="p-impressio">Les cobertes en pendent seran accessibles només per a la seva conservació. El personal encarregat del treball anirà proveït de cinturó de seguretat que subjectarà a dos ganxos de servei o a punts fixos de la coberta. És recomanable que els operaris portin sabates amb soles toves i antilliscants. No es transitarà sobre les cobertes si estan mullades.</p>
<p class="p-impressio">Si a la coberta s’instal·len noves antenes, equips d’aire condicionat o, en general, aparells que requereixin ser fixats, la subjecció no pot afectar la impermeabilització. Tampoc no s’han d’utilitzar com a punts d’ancoratge de tensors, de baranes metàl·liques o d’obra, ni de conductes d’evacuació de fums existents, llevat que un tècnic especialitzat ho autoritzi. Si aquestes noves instal·lacions necessiten d’un manteniment periòdic, caldrà preveure al seu entorn les proteccions adequades.</p>
<p class="p-impressio">En el cas que s’observin humitats a les plantes sota coberta, s’hauran de controlar, ja que poden tenir un efecte negatiu sobre els elements estructurals.</p>
<p class="p-impressio">La molsa i els fongs s’eliminaran amb un raspall i si cal s’aplicarà un fungicida.</p>
<p class="p-impressio">Els treballs de reparació es faran sempre retirant la part malmesa per tal de no sobrecarregar l’estructura. </p>
<p class="p-impressio">Lluernes i claraboies:</p>
<p class="p-impressio">Les claraboies i lluernes s’han de netejar amb assiduïtat, ja que en cas d’embrutar-se redueixen considerablement la quantitat de llum que deixen passar.</p>
<p class="p-impressio">Per la seva situació dins l’edifici, han d’extremar-se les mesures de seguretat en el moment de netejar-les per tal d’evitar accidents. </p>'

  	when 'particions'
  		return ''
  	when 'sanejament'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">La xarxa de sanejament es compon bàsicament d’elements i conductes de desguàs dels aparells de cada planta i d’alguns recintes de l’edifici, que connecten amb la xarxa de sanejament vertical (baixants) i amb els claveguerons, pericons, col·lectors, etc., fins a la xarxa municipal o un altre sistema autoritzat.</p>
<p class="p-impressio">A la xarxa de sanejament és molt important conservar la instal·lació neta i lliure de dipòsits. Es pot aconseguir amb un manteniment reduït basat en una utilització adequada i en uns hàbits higiènics correctes per part dels usuaris.</p>
<p class="p-impressio">La xarxa d\'evacuació d\'aigua, sobretot l\'inodor, no es pot utilitzar com a abocador de deixalles. No s’hi poden llençar plàstics, cotó, gomes, compreses, fulles d\'afaitar, bastonets, etc. Les substàncies i els elements anteriors, per si mateixos o combinats, poden taponar o, fins i tot, destruir per procediments físics o reaccions químiques les conduccions i/o els seus elements, produint-se vessaments pudents com ara fuites, taques, etc.</p>
<p class="p-impressio">S\'han de revisar amb freqüència els sifons de les buneres i comprovar que no els falti aigua, per tal d\'evitar que les olors de la xarxa surtin a l\'exterior.</p>
<p class="p-impressio">Per desembussar els conductes no es poden utilitzar àcids o productes que perjudiquin els desguassos. S\'utilitzaran sempre detergents biodegradables per tal d\'evitar la creació d\'escumes que petrifiquin dins dels sifons i dels pericons de l\'edifici. Tampoc s\'abocaran aigües que continguin olis, colorants permanents o substàncies tòxiques. Com a exemple, un litre d\'oli mineral contamina 10.000 litres d\'aigua.</p>
<p class="p-impressio">Qualsevol modificació a la instal·lació o a les condicions d\'ús que puguin alterar el normal funcionament serà feta mitjançant un estudi previ i sota la direcció del vostre Tècnic de Capçalera.</p>
<p class="p-impressio">Les possibles fuites es localitzaran i repararan al més aviat possible. </p>'

  	when 'aigua'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Responsabilitats:</p>
<p class="p-impressio">El manteniment de la instal·lació a partir del comptador (no només des de la clau de pas de l\'habitatge) és a càrrec de cadascun dels usuaris. El manteniment de les instal·lacions situades entre la clau de pas de l\'edifici i els comptadors correspon al propietari de l\'immoble o a la Comunitat de Propietaris.</p>
<p class="p-impressio">La cambra de comptadors serà accessible només per al porter o vigilant i el personal de la companyia subministradora o de manteniment. Cal vigilar que les reixes de ventilació no estiguin obstruïdes, així com també l’accés a la cambra.</p>
<p class="p-impressio">Precaucions:</p>
<p class="p-impressio">Es recomana tancar la clau de pas de l\'habitatge en cas d\'absència prolongada. Si l\'absència ha estat molt llarga s\'han de revisar els junts abans d\'obrir la clau de pas.</p>
<p class="p-impressio">Totes les fuites o defectes de funcionament a les conduccions, els accessoris o els equips es repararan immediatament.</p>
<p class="p-impressio">Totes les canalitzacions metàl·liques es connectaran a la xarxa de posada a terra. És prohibit d’utilitzar les canonades com a elements de contacte de les instal·lacions elèctriques amb el terra.</p>
<p class="p-impressio">Per desembussar canonades, no s’han d’utilitzar objectes punyents que puguin perforar-les.</p>
<p class="p-impressio">En cas de baixes temperatures, s’ha de deixar córrer l’aigua per les canonades per tal d’evitar que es geli l’aigua al seu interior.</p>
<p class="p-impressio">El correcte funcionament de la xarxa d’aigua calenta és un dels factors que influeixen més decididament en l’estalvi d’energia, per aquest motiu ha de ser objecte d’una atenció més gran per obtenir un rendiment energètic òptim.</p>
<p class="p-impressio">A la revisió general s’ha de comprovar l’estat de l’aïllament i la senyalització de la xarxa d’aigua, l’estanquitat de les unions i els junts, i el correcte funcionament de les claus de pas i vàlvules, i cal verificar la possibilitat de tancament total o parcial de la xarxa.</p>'

  	when 'electricitat'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">La instal·lació elèctrica està formada pel comptador, per la derivació individual, pel quadre general de comandament i protecció i pels circuits de distribució interior. Al mateix temps, el quadre general de comandament i protecció està format per un interruptor de control de potència (ICP), un interruptor diferencial (ID) i els petits interruptors automàtics (PIA).</p>
<p class="p-impressio">L’ICP és el mecanisme que controla la potència que subministra la xarxa de companyia. L’ICP desconnecta la instal·lació quan la potència consumida és superior a la contractada o bé quan es produeix un curtcircuit (contacte directe entre dos fils conductors) i el PIA del seu circuit no es dispara prèviament.</p>
<p class="p-impressio">L’interruptor diferencial (ID) protegeix contra les fuites accidentals de corrent com, per exemple, les que es produeixen quan es toca amb el dit un endoll o quan un fil elèctric toca una canonada d’aigua o la carcassa de la rentadora. L’interruptor diferencial (ID) és indispensable per tal d’evitar accidents. Sempre que es produeix una fuita salta l’interruptor.</p>
<p class="p-impressio">Cada circuit de distribució interior té assignat un PIA que salta quan el consum del circuit és superior al previst. Aquest interruptor protegeix contra els curtcircuits i les sobrecàrregues.</p>
<p class="p-impressio">Responsabilitats:</p>
<p class="p-impressio">El manteniment de la instal·lació elèctrica a partir del comptador (i no només des del quadre general d’entrada a l’habitatge) és a càrrec de cadascun dels usuaris.</p>
<p class="p-impressio">El manteniment de la instal·lació entre la caixa general de protecció i els comptadors correspon al propietari de l’immoble o a la Comunitat de Propietaris. Tot i que la instal·lació elèctrica té desgasts molt petits, difícils d’apreciar, és convenient fer revisions periòdiques per tal de comprovar el bon funcionament dels mecanismes i l’estat del cablejat, de les connexions i de l’aïllament. A la revisió general de la instal·lació elèctrica s’ha de verificar la canalització de les derivacions individuals comprovant l’estat dels conductes, fixacions, aïllament i tapes de registre, i verificar l’absència d’humitat.</p>
<p class="p-impressio">La cambra de comptadors serà accessible només per al porter o vigilant, i el personal de la companyia subministradora o de manteniment. S’ha de vigilar que les reixes de ventilació no estiguin obstruïdes, així com també l’accés a la cambra.</p>
<p class="p-impressio">Precaucions:
<p class="p-impressio">Les instal·lacions elèctriques s’han d’utilitzar amb precaució pel perill que comporten. Està prohibit manipular els circuits i els quadres generals, aquestes operacions han de ser efectuades exclusivament per personal especialista.</p>
<p class="p-impressio">No s’ha de permetre als nens manipular els aparells elèctrics quan estiguin endollats i, en general, s’ha d’evitar manipular-los amb les mans humides. S’ha de tenir especial cura en les instal·lacions de banys i cuines (locals humits).</p>
<p class="p-impressio">No es poden connectar als endolls aparells de potència superior a la prevista o diversos aparells que, en conjunt, tinguin una potència superior. Si s’aprecia un escalfament dels cables o dels endolls connectats a un determinat punt, s’han de desconnectar. És símptoma que la instal·lació està sobrecarregada o no està preparada per tal de rebre l’aparell. Les clavilles dels endolls han d’estar ben cargolades per tal d’evitar que facin espurnes. Les connexions dolentes originen escalfaments que poden generar un incendi.</p>
<p class="p-impressio">És recomanable tancar l’interruptor de control de potència (ICP) de l’habitatge en cas d’absència prolongada. Si es deixa el frigorífic en funcionament, no és possible desconnectar l’interruptor de control de potència, però sí tancar els petits interruptors automàtics d’altres circuits.</p>
<p class="p-impressio">Periòdicament, és recomanable prémer el botó de prova del diferencial (ID), el qual ha de desconnectar tota la instal·lació. Si no la desconnecta, el quadre no ofereix protecció i caldrà avisar l’instal·lador.</p>
<p class="p-impressio">Per netejar els llums i les plaques dels mecanismes elèctrics s’ha de desconnectar la instal·lació elèctrica. S’han de netejar amb un drap lleugerament humit amb aigua i detergent. L’electricitat es connectarà un cop s’hagin assecat les plaques.</p>'

  	when 'climatitzacio'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">S’han de llegir i seguir les instruccions de la instal·lació abans de posar-la en funcionament per primera vegada.</p>
<p class="p-impressio">El correcte funcionament de la instal·lació és un dels factors que influeixen més decisivament en l’estalvi d’energia, per tant s\'ha de mantenir amb cura per obtenir un rendiment òptim. </p>
<p class="p-impressio">Cal informar al personal de manteniment si es detecten fuites d’aigua en els aparells emissors o en les conduccions i es procedirà a la seva reparació immediata. Si és el cas s’avisarà del fet a la Propietat.</p>
<p class="p-impressio">Els aparells emissors de calor no han de tapar-se amb cap moble o objecte.</p>
<p class="p-impressio">Després d’una fuita de gas, no es pot encendre la calefacció fins que l’instal·lador l’hagi revisada.</p>'

  	when 'gas'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">El grau de perillositat de les instal·lacions de gas combustible és superior a qualsevol altra. Per aquesta raó s’extremaran les mesures de seguretat. Qualsevol intervenció sobre la instal·lació o sobre els aparells de consum ha d’estar feta per una empresa especialitzada.</p>
<p class="p-impressio">Cal seguir les instruccions de manteniment dels aparells de gas que proporcionen els seus fabricants.</p>
<p class="p-impressio">No es poden obstruir les xemeneies d’evacuació de fums, ni es poden deixar objectes a prop de focus de calor o superfícies calentes.</p>
<p class="p-impressio">No es poden tapar els forats de ventilació dels espais que contenen instal·lacions de gas. Hi ha d\'haver ventilació tant a la part alta com a la part baixa de l’espai.</p>
<p class="p-impressio">Els gasos propà i butà són més pesants que l\'aire i, per tant, en cas de fuita van cap avall. El gas natural és menys pesant que l\'aire i, per tant, en cas de fuita va cap a amunt.</p>
<p class="p-impressio">Si es vol donar subministrament a uns altres aparells que els de construcció original s\'ha de demanar permís a la Propietat. La instal·lació del nou aparell l\'ha de fer una empresa autoritzada.</p>
<p class="p-impressio">Els cremadors s’han de mantenir nets de dipòsits i residus de la combustió. Es comprovaran periòdicament les emissions de gasos contaminants i si és necessari es faran els ajustos i les reparacions en els aparells per tal de que aquestes es mantinguin dintre dels paràmetres establerts.</p>
<p class="p-impressio">Es recomana que en absències llargues es tanqui l\'aixeta de pas general de la instal·lació de gas. Durant la nit és millor fer el mateix, sempre que no quedi en funcionament cap aparell de gas.</p>
<p class="p-impressio">El manteniment de les instal·lacions situades entre l\'aixeta d\'entrada de l\'immoble i el comptador correspon a la Propietat.</p>
<p class="p-impressio">Els tubs de gas no s\'han de fer servir per a les preses de terra dels aparells elèctrics ni tampoc per a penjar-hi objectes.</p>
<p class="p-impressio">La cambra de comptadors només serà accessible al porter, al vigilant, o al personal de la companyia subministradora i al de manteniment. S’ha de vigilar que tant les reixes de ventilació com l’accés a la cambra no quedin obstruïts.</p>
<p class="p-impressio">Si es detecta una fuita de gas no s’ha d’obrir cap llum ni accionar interruptors o connectar aparells elèctrics. La connexió o desconnexió d’aparells elèctrics pot provocar guspires que a la seva vegada poden provocar la deflagració del gas acumulat. Tampoc es poden fer servir encenedors ni encendre llumins. En aquests casos s’intentarà tancar la clau de pas del gas i a continuació es ventilarà el recinte a on s’ha produït la fuga obrint portes i finestres de bat a bat. Finalment s’ha d’avisar de l’avaria a una empresa instal·ladora autoritzada o bé al servei d’urgències de l‘empresa subministradora perquè localitzi l’avaria.</p>'

  	when 'ventilacio'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">S’han de ventilar els espais interiors per evitar humitats de condensació, especialment si la calefacció és d\'estufes de gas butà. La ventilació s\'ha de fer preferentment en hores de sol, i per espai de 20 o 30 minuts.</p>
<p class="p-impressio">Els fongs que apareixen en els punts més freds dels recintes tenen el seu origen en humitats de condensació i no en degoters, com es creu normalment. La neteja s’ha de realitzar amb productes fungicides, però s’ha de tenir en compte que de no resoldre el problema d’origen, els fongs tornaran a aparèixer si no es millora la ventilació o l’aïllament tèrmic de la peça.</p>
<p class="p-impressio">En cas d’augmentar l’aïllament tèrmic de forma puntual sense reduir la humitat ambiental, la condensació es produirà en un altre punt fred provocant deterioraments dels revestiments.</p>
<p class="p-impressio">No és permès de connectar extractors a conductes d\'evacuació de gasos de calderes de calefacció.</p>
<p class="p-impressio">Cal llegir i seguir les instruccions dels aparells d’extracció mecànica.</p>'

  	when 'incendis'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Les instruccions d’ús dels components de la instal·lació figuren en els mateixos aparells. Tots els components de la instal·lació han d’estar al seu lloc i a l’abast. No s’han d’ocultar.</p>
<p class="p-impressio">Queda completament prohibit fer un ús indegut dels elements de la instal·lació contra incendis.</p>
<p class="p-impressio">S’ha de mantenir la instal·lació de protecció al foc en condicions reglamentàries. Totes les tasques de manteniment, revisió i reparació han d’estar fetes per una empresa autoritzada.</p>
<p class="p-impressio">En cas d’incendi:</p>
<p class="p-impressio">Si es produeix un conat d’incendi, cal avisar els bombers i als ocupants de l’immoble immediatament. Durant els primers minuts d’inici del foc, és possible intentar controlar-lo amb els mitjans de què disposi l’edifici (mànegues, extintors). En aquest cas sempre han d’actuar dues persones amb un extintor cadascuna o amb una mànega atacant al foc. Mai s’ha d’actuar sol. Si passats uns instants no s’ha dominat el foc, s’aconsella evacuar l’edifici seguint el pla previst d’evacuació de l’immoble.</p>
<p class="p-impressio">Si en algun conat d’incendi s’ha produït una descàrrega parcial o total d’un extintor, s’han desenrotllat mànegues o s’han accionat polsadors de disparadors d’alarma, cal fer-ho saber al conserge o al personal de manteniment de l’edifici perquè duguin a terme les revisions escaients i restableixin l’estat normal de la instal·lació.</p>'

  	when 'ascensor'
  		return '<p class="apartat-sistema">Instruccions d’ús:</p>
<p class="p-impressio">Els ascensors no poden ser utilitzats per nens que no vagin acompanyats de persones adultes.</p>
<p class="p-impressio">Si s’observa que falla algun mecanisme, s’ha de parar el servei i avisar l’encarregat del manteniment.</p>
<p class="p-impressio">Els ascensors no es poden utilitzar com a muntacàrregues.</p>
<p class="p-impressio">No es pot fumar dins de la cabina de l’ascensor.</p>
<p class="p-impressio">El conserge, porter, president de la comunitat o a qui el president delegui, és responsable del seguiment d’aquestes recomanacions d’ús.</p>
<p class="p-impressio">En cas d’avaria, de manca de subministrament elèctric, etc. és obligatori tenir connectada la cabina amb l’empresa de manteniment.</p>
<p class="p-impressio">Persones atrapades a l’interior per una avaria</p>
<p class="p-impressio">Si alguna persona queda atrapada a l’interior de la cabina a causa d’una avaria, és fonamental no perdre la calma. Cal prémer el timbre d’alarma de la botonera de cabina o comunicar el fet per telèfon, si se’n disposa d’un. Mai s’ha d’intentar obrir les portes manualment per a sortir de la cabina.</p>
<p class="p-impressio">Si l’avaria és un tall de subministrament elèctric, la cabina s’aturarà i s’encendrà el llum d’emergència. Cal recordar que en aquest supòsit l’ascensor és completament segur. Si en cas d’avaria no funciona el timbre d’alarma, cal cridar periòdicament perquè se sàpiga la presència d’una persona en la cabina. Cap persona atrapada a l’interior d’una cabina ha d’intentar sortir-ne forçant les portes, i encara menys quan l’ascensor s’hagi aturat entre dues plantes.</p>
<p class="p-impressio">Les persones que estan fora de l’ascensor no han de manipular cap mecanisme ni cap porta. Es limitaran a avisar a la empresa de manteniment o, en un cas greu, als bombers. Si és possible, convé informar del que passa a la persona atrapada vigilant que mantingui la calma.</p>'

  	when 'telecomunicacions'
  		return ''
  	when 'especials'
  		return ''
  	end
  end

  # Per al manual de l'habitatge fem unes instruccions específiques per terrats i terrasses en comptes de posar la de coberta en general
  def instruccions_terrasses_pdf
    return '<w:p w14:paraId="1503826F" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"><w:r><w:t xml:space="preserve">Els terrats i les </w:t></w:r><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/><w:r><w:t>terrasses</w:t></w:r><w:r><w:t xml:space="preserve"> s’han de mantenir netes i sense herbes, especialment les buneres, les canals i els aiguafons. És preferible no col·locar jardineres a prop dels desguassos o bé que estiguin elevades del sòl per permetre el pas de l’aigua.</w:t></w:r></w:p><w:p w14:paraId="42AFA036" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"/><w:p w14:paraId="66A200D2" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"><w:r><w:t>Aquest tipus de coberta només ha d’utilitzar-se per a l’ús a què hagi estat projectada. En aquest sentit, s’evitarà l’emmagatzematge de materials, mobles, etc., i l’abocament de productes químics agressius com ara olis, dissolvents o lleixiu.</w:t></w:r></w:p><w:p w14:paraId="700663E2" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"/><w:p w14:paraId="4032CF03" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"><w:r><w:t>Si a la coberta s’hi instal·len noves antenes, equips d’aire condicionat o, en general, aparells que requereixin ser fixats, la subjecció no ha d’afectar la impermeabilització.</w:t></w:r></w:p><w:p w14:paraId="783C6DF1" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"/><w:p w14:paraId="4152BE2C" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"><w:r><w:t xml:space="preserve">Tampoc no s’han d’utilitzar com a punts d’ancoratge de tensors, de baranes metàl·liques o d’obra, ni de conductes d’evacuació de fums existents, llevat que el Tècnic de Capçalera ho autoritzi. Si aquestes noves instal·lacions precisen d’un manteniment periòdic, es preveuran al seu entorn les proteccions adequades. </w:t></w:r></w:p><w:p w14:paraId="1E566F22" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"/><w:p w14:paraId="74F23A53" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"><w:r><w:t xml:space="preserve">En cas que s’observin humitats als pisos sota coberta, caldrà controlar-les, ja que poden tenir un efecte negatiu sobre els elements estructurals. </w:t></w:r></w:p><w:p w14:paraId="0BB46D3A" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"/><w:p w14:paraId="23CF1347" w14:textId="77777777" w:rsidR="0020580C" w:rsidRDefault="0020580C" w:rsidP="0020580C"><w:r><w:t xml:space="preserve">Cal procurar, sempre que sigui possible, no caminar per sobre de les cobertes planes no transitables. Quan sigui necessari trepitjar-les s’ha d’anar amb molt de compte per no produir desperfectes. El personal d’inspecció, conservació o reparació estarà proveït de sabates de sola tova. </w:t></w:r></w:p><w:p w14:paraId="5A235007" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00500DE7"/>'
  end

  #def operacions_pdf_old(sistema)
  #  referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema)
  #  llistat_operacions = '<div class="espaiador"></div><p class="apartat-sistema">Instruccions de manteniment:</p>'
  #  referencies.each do |referencia|
  #    operacio = Operacio.find(referencia.operacio_id)
  #    llistat_operacions = llistat_operacions + '
  #    <div class="taula-container">
  #    <table class="taula-dades">
	#		  <tbody>
	#		    <tr>
	#		      <td><span class="titol-taula">Descripció:</span><br/>' + operacio.descripcio_ca + '</td>
	#		    </tr>
	#		  </tbody>
	#		</table>
	#		<table class="taula-dades-final">
	#			<tbody>
	#		    <tr>
	#		    	<td class="taula-dos-columnes"><span class="titol-taula">Periodicitat:</span><br/>' + operacio.periodicitat_text_ca + '</td>
	#		      <td class="taula-dos-columnes"><span class="titol-taula">Responsable:</span><br/>' + operacio.responsable_ca + '</td>
	#		    </tr>
	#		  </tbody>
	#		</table>
  #   </div>'			     
  #  end
  #  return llistat_operacions
  #end

  def operacions_pdf(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema)
    llistat_operacions = '<div class="espaiador"></div><p class="apartat-sistema">Instruccions de manteniment:</p>'
    operacions = Array.new
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      operacions.push(operacio)
    end

    responsables = operacions.map(&:responsable_ca)
    responsables = responsables.uniq

    responsables.each do |responsable|
      llistat_operacions = llistat_operacions + '<div class="nom-responsable">' + responsable + '</div>
      <div class="llistat-container">
        <table class="taula-dades unstriped">
          <thead>
            <th>Periodicitat</th>
            <th>Descripció</th>
          <tbody>'
      operacions.each do |operacio|
        if operacio.responsable_ca == responsable
          llistat_operacions = llistat_operacions + '
            <tr>
              <td>' + operacio.periodicitat_text_ca + '</td>
              <td>' + operacio.descripcio_ca + '</td>
            </tr>'     
        end
      end
      llistat_operacions = llistat_operacions + '
          </tbody>
        </table>
      </div>'
    end
    return llistat_operacions
  end

  def operacions_manual_habitatge_pdf(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema, :manual_habitatge => true)
    llistat_operacions = ''
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      llistat_operacions = llistat_operacions + '
      <div class="taula-container">
      <table class="taula-dades">
			  <tbody>
			    <tr>
			      <td><span class="titol-taula">Descripció:</span><br/>' + operacio.descripcio_ca + '</td>
			    </tr>
			  </tbody>
			</table>
			<table class="taula-dades-final">
				<tbody>
			    <tr>
			    	<td class="taula-dos-columnes"><span class="titol-taula">Periodicitat:</span><br/>' + operacio.periodicitat_text_ca + '</td>
			      <td class="taula-dos-columnes"><span class="titol-taula">Responsable:</span><br/>' + operacio.responsable_ca + '</td>
			    </tr>
			  </tbody>
			</table>
      </div>'
    end
    return llistat_operacions
  end

  def text_manteniment_pdf
  	text_manteniment = ''
	  existeix_sistema = comprovacio_sistema('fonamentacio')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Fonamentació')
	    text_manteniment = text_manteniment + descripcio_pdf(Fonamentacio, 'fonamentacio')
	    text_manteniment = text_manteniment + instruccions_pdf('fonamentacio')
	    text_manteniment = text_manteniment + operacions_pdf('fonamentacio')
	  end
	  existeix_sistema = comprovacio_sistema('estructura')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Estructura')
	    text_manteniment = text_manteniment + descripcio_pdf(Estructura, 'estructura')
	    text_manteniment = text_manteniment + instruccions_pdf('estructura')
	    text_manteniment = text_manteniment + operacions_pdf('estructura')
	  end
	  existeix_sistema = comprovacio_sistema('tancaments')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Tancaments verticals')
	    text_manteniment = text_manteniment + descripcio_pdf(TancamentsVertical, 'tancaments')
	    text_manteniment = text_manteniment + instruccions_pdf('tancaments')
	    text_manteniment = text_manteniment + operacions_pdf('tancaments')
	  end
	  existeix_sistema = comprovacio_sistema('cobertes')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Cobertes')
	    text_manteniment = text_manteniment + descripcio_pdf(Coberta, 'coberta')
	    text_manteniment = text_manteniment + instruccions_pdf('cobertes')
	    text_manteniment = text_manteniment + operacions_pdf('cobertes')
	  end
	  existeix_sistema = comprovacio_sistema('particions')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Particions i acabats')
	    text_manteniment = text_manteniment + descripcio_pdf(Particio, 'particions')
	    text_manteniment = text_manteniment + instruccions_pdf('particions')
	    text_manteniment = text_manteniment + operacions_pdf('particions')
	  end
	  existeix_sistema = comprovacio_sistema('sanejament')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Sanejament')
	    text_manteniment = text_manteniment + descripcio_pdf(Sanejament, 'sanejament')
	    text_manteniment = text_manteniment + instruccions_pdf('sanejament')
	    text_manteniment = text_manteniment + operacions_pdf('sanejament')
	  end
	  existeix_sistema = comprovacio_sistema('aigua')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Subministrament d\'aigua')
	    text_manteniment = text_manteniment + descripcio_pdf(Aigua, 'aigua')
	    text_manteniment = text_manteniment + instruccions_pdf('aigua')
	    text_manteniment = text_manteniment + operacions_pdf('aigua')
	  end
	  existeix_sistema = comprovacio_sistema('electricitat')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Instal·lació elèctrica')
	    text_manteniment = text_manteniment + descripcio_pdf(Electricitat, 'electricitat')
	    text_manteniment = text_manteniment + instruccions_pdf('electricitat')
	    text_manteniment = text_manteniment + operacions_pdf('electricitat')
	  end
	  existeix_sistema = comprovacio_sistema('climatitzacio')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('ACS, calefacció i refrigeració')
	    text_manteniment = text_manteniment + descripcio_pdf(Climatitzacio, 'climatitzacio')
	    text_manteniment = text_manteniment + instruccions_pdf('climatitzacio')
	    text_manteniment = text_manteniment + operacions_pdf('climatitzacio')
	  end
	  existeix_sistema = comprovacio_sistema('gas')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Instal·lació de gas')
	    text_manteniment = text_manteniment + descripcio_pdf(Ga, 'gas')
	    text_manteniment = text_manteniment + instruccions_pdf('gas')
	    text_manteniment = text_manteniment + operacions_pdf('gas')
	  end
	  existeix_sistema = comprovacio_sistema('ventilacio')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Ventilació')
	    text_manteniment = text_manteniment + descripcio_pdf(Ventilacio, 'ventilacio')
	    text_manteniment = text_manteniment + instruccions_pdf('ventilacio')
	    text_manteniment = text_manteniment + operacions_pdf('ventilacio')
	  end
	  existeix_sistema = comprovacio_sistema('incendis')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Protecció contra incendis')
	    text_manteniment = text_manteniment + descripcio_pdf(Incendi, 'incendis')
	    text_manteniment = text_manteniment + instruccions_pdf('incendis')
	    text_manteniment = text_manteniment + operacions_pdf('incendis')
	  end
	  existeix_sistema = comprovacio_sistema('ascensor')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Ascensors')
	    text_manteniment = text_manteniment + descripcio_pdf(Ascensor, 'ascensors')
	    text_manteniment = text_manteniment + instruccions_pdf('ascensor')
	    text_manteniment = text_manteniment + operacions_pdf('ascensor')
	  end
	  existeix_sistema = comprovacio_sistema('telecomunicacions')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Instal·lació de telecomunicacions')
	    text_manteniment = text_manteniment + descripcio_pdf(Telecomunicacio, 'telecomunicacions')
	    text_manteniment = text_manteniment + instruccions_pdf('telecomunicacions')
	    text_manteniment = text_manteniment + operacions_pdf('telecomunicacions')
	  end
	  existeix_sistema = comprovacio_sistema('especials')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf('Instal·lacions especials')
	    text_manteniment = text_manteniment + descripcio_pdf(Especial, 'especials')
	    text_manteniment = text_manteniment + instruccions_pdf('especials')
	    text_manteniment = text_manteniment + operacions_pdf('especials')
	  end
	  return text_manteniment
  end

  def text_manual_habitatge_pdf
    text_manteniment = ''
    existeix_sistema = comprovacio_sistema_manual('estructura')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Estructura')
      text_manteniment = text_manteniment + descripcio_pdf(Estructura, 'estructura')
      text_manteniment = text_manteniment + instruccions_pdf('estructura')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('estructura')
    end
    existeix_sistema = comprovacio_sistema_manual('tancaments')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Tancaments verticals')
      text_manteniment = text_manteniment + descripcio_pdf(TancamentsVertical, 'tancaments')
      text_manteniment = text_manteniment + instruccions_pdf('tancaments')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('tancaments')
    end
    existeix_sistema = comprovacio_sistema_manual('cobertes')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Terrats i terrasses')
      text_manteniment = text_manteniment + descripcio_pdf(Coberta, 'coberta')
      text_manteniment = text_manteniment + instruccions_pdf('cobertes')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('cobertes')
    end
    existeix_sistema = comprovacio_sistema_manual('particions')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Particions i acabats')
      text_manteniment = text_manteniment + descripcio_pdf(Particio, 'particions')
      text_manteniment = text_manteniment + instruccions_pdf('particions')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('particions')
    end
    existeix_sistema = comprovacio_sistema_manual('sanejament')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Sanejament')
      text_manteniment = text_manteniment + descripcio_pdf(Sanejament, 'sanejament')
      text_manteniment = text_manteniment + instruccions_pdf('sanejament')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('sanejament')
    end
    existeix_sistema = comprovacio_sistema_manual('aigua')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Subministrament d\'aigua')
      text_manteniment = text_manteniment + descripcio_pdf(Aigua, 'aigua')
      text_manteniment = text_manteniment + instruccions_pdf('aigua')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('aigua')
    end
    existeix_sistema = comprovacio_sistema_manual('electricitat')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Instal·lació elèctrica')
      text_manteniment = text_manteniment + descripcio_pdf(Electricitat, 'electricitat')
      text_manteniment = text_manteniment + instruccions_pdf('electricitat')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('electricitat')
    end
    existeix_sistema = comprovacio_sistema_manual('climatitzacio')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('ACS, calefacció i refrigeració')
      text_manteniment = text_manteniment + descripcio_pdf(Climatitzacio, 'climatitzacio')
      text_manteniment = text_manteniment + instruccions_pdf('climatitzacio')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('climatitzacio')
    end
    existeix_sistema = comprovacio_sistema_manual('gas')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Instal·lació de gas')
      text_manteniment = text_manteniment + descripcio_pdf(Ga, 'gas')
      text_manteniment = text_manteniment + instruccions_pdf('gas')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('gas')
    end
    existeix_sistema = comprovacio_sistema_manual('ventilacio')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf('Ventilació')
      text_manteniment = text_manteniment + descripcio_pdf(Ventilacio, 'ventilacio')
      text_manteniment = text_manteniment + instruccions_pdf('ventilacio')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf('ventilacio')
    end
    return text_manteniment
  end


  def espdf_arxiu_documents_edifici_nou
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
      arxiu = ChecklistNouPlurifamiliar.where(:edifici_id => @edifici.id).last
    elsif @edifici.tipus_edifici == 'nou_unifamiliar'
      arxiu = ChecklistNouUnifamiliar.where(:edifici_id => @edifici.id).last
    elsif @edifici.tipus_edifici == 'nou_terciari'
      arxiu = ChecklistNouTerciari.where(:edifici_id => @edifici.id).last
    end
    pdf_titols_arxiu = ''

    def titol_apartat_arxiu(text_titol)
      return '<p class="subtitol-seccio-document">' + text_titol + '</p><div class="salt-pagina"></div>'
    end

    if arxiu.llicencies_preceptives == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Llicències preceptives")
    end
    if arxiu.certificat_final_obra == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificat final d'obra")
    end
    if arxiu.acta_recepcio_obra == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Acta de recepció definitiva de l'obra")
    end
    if arxiu.escriptura_publica == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Escriptura pública de declaració d'obra nova")
    end
    if arxiu.documents_garantia == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documents acreditatius de garantia")
    end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
	    if arxiu.documents_garantia_parts_comunes == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documents de garantia d'instal·lacions de parts comunes")
	    end
	  end
    if arxiu.certificacio_energetica == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificació energètica")
    end
    if arxiu.polissa_assegurances == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Pòlisses d'assegurances")
    end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
	    if arxiu.escriptura_propietat_horitzontal == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Escriptura de divisió en règim de propietat horitzontal")
	    end
	    if arxiu.estatus_comunitat == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Estatuts de la comunitat de propietaris")
	    end
	  end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
      if arxiu.cedules_regims_juridics == true
        pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Cèdules de declaració de règims jurídics especials o qualificacions d'habitatges protegits")
      end
    end
    if arxiu.carregues_reals == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Càrregues reals existents")
    end
    if arxiu.documents_acreditatius_ajuts == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documents acreditatius dels ajuts i beneficis atorgats a l'edifici")
    end
    if arxiu.documents_justificacio_operacions == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documents de justificació de la realització d'operacions de reparació, manteniment i rehabilitació")
    end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
	    if arxiu.certificat_final_obra_instalacions == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificats final d’obra de les instal·lacions comunes de baixa tensió, gasos combustibles, productes petrolífers o instal·lacions tèrmiques")
	    end
	  end
    if arxiu.declaracions_ce_ascensors == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Declaracions CE que reconeixen la conformitat dels ascensors instal·lats")
    end

    return pdf_titols_arxiu
  end

  def espdf_arxiu_documents_edifici_existent
    arxiu = ChecklistExistentPlurifamiliar.where(:edifici_id => @edifici.id).last
    pdf_titols_arxiu = ''

    def titol_apartat_arxiu(text_titol)
      return '<p class="subtitol-seccio-document">' + text_titol + '</p><div class="salt-pagina"></div>'
    end

    if arxiu.iite == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Informe d’inspecció tècnica obligatòria (IITE)")
    end
    if arxiu.document_lliurament_iite == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Document acreditatiu del lliurament a l’Administració de les dades bàsiques de la IITE")
    end
    if arxiu.comunicat_ens_local == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("El comunicat a l’ens local del municipi al qual pertany l’edifici en cas de situació de risc per a les persones")
    end
    if arxiu.programa_rehabilitacio == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Programa de rehabilitació que adopti les mesures correctores")
    end
    if arxiu.certificat_final_obra == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificats de final d’obra de totes les obres que s’executin en l’edifici")
    end
    if arxiu.certificat_aptitud == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificat d’aptitud")
    end
    if arxiu.certificacio_energetica == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificat d’eficiència energètica de l’edifici")
    end
    if arxiu.documents_justificatius_operacions == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documents que justifiquin la realització d’operacions de reparació, manteniment i rehabilitació de caràcter obligatori, així com la identificació de les empreses o professionals que les han realitzades i les garanties que s’han donat")
    end
    if arxiu.pressupostos_obres == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Pressupostos i contractes d’obres, manteniments i honoraris professionals")
    end
    if arxiu.certificats_instalacions_comunes == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificats d’inscripció en el Registre d’instal·lacions tècniques de seguretat industrial de Catalunya de les instal·lacions comunes de l’edifici de baixa tensió, gasos combustibles, instal·lacions petrolíferes, instal·lacions tèrmiques i d’ascensors que s’hagin realitzat")
    end
    if arxiu.certificats_inspeccions_tecniques == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificats d’inspeccions tècniques de les instal·lacions comunes sotmeses a reglamentació de seguretat industrial")
    end

    return pdf_titols_arxiu
  end

end