module PdfGeneratorEs

	def titol_pdf_es(sistema)
  	text_titol = '<div class="salt-pagina"></div><p class="titol-sistema">' + sistema + '</p>'
  	return text_titol
  end

  def descripcio_pdf_es(sistema)
  	sistema_seleccionat = sistema.where(:edifici_id => @edifici.id).last
    #Inici del llistat
    llistat_elements = '<p class="apartat-sistema">Descripción constructiva:</p><ul>'
    sistema_seleccionat.attributes.each_pair do |name, value|
      if (value == true)
        element = ElementPredefinit.where(:nom_element => name).last
        #Afegim els elements del llistat
        llistat_elements = llistat_elements + '<li>' + element.descripcio_es + '</li>'
      end
    end
    #Introduïm els elements definits per l'usuari
    elements_usuari = Element.where(:edifici_id => @edifici.id, :sistema_element => sistema_usuari)
    elements_usuari.each do |element_usuari|
      llistat_elements = llistat_elements + '<li>' + element_usuari.nom_element + '</li>'
    end
    #Tanquem el llistat
    llistat_elements = llistat_elements + '</ul><div class="salt-pagina"></div>'
    return llistat_elements
  end

  def instruccions_pdf_es(sistema)
  	case sistema
  	when 'fonamentacio'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Hay que evitar cualquier tipo de cambio en el sistema de carga de las diferentes partes del edificio. Si desea introducir modificaciones o cualquier cambio de uso dentro del edificio consulte a su Técnico de Cabecera.</p>
<p>Las lesiones (grietas, desplomes) en la cimentación no son apreciables directamente y se detectan a partir de las que aparecen en otros elementos constructivos (paredes, techos, etc.). En estos casos, hace falta que el Técnico de Cabecera haga un informe sobre las lesiones detectadas, determine la gravedad y, en su caso, la necesidad de intervención.</p>
<p>Las alteraciones de importancia efectuadas en los terrenos próximos, tales como: nuevas construcciones, realización de pozos, túneles, vías, carreteras o rellenos de tierras pueden afectar a la cimentación del edificio. Si durante la realización de los trabajos se detectan lesiones, se deberán estudiar y, en su caso, se podrá exigir su reparación.</p>
<p>Las corrientes subterráneas de agua natural y las fugas de conducciones de agua o de desagües pueden ser causa de alteraciones del terreno y de descalces de la cimentación. Estos descalces pueden producir un asentamiento de la zona afectada, que puede transformarse en deterioros importantes en el resto de la estructura. Por este motivo, es primordial eliminar rápidamente cualquier tipo de humedad que provenga del subsuelo.</p>
<p>Después de lluvias fuertes se observan las posibles humedades y el buen funcionamiento de las perforaciones de drenaje y desagüe.</p> 
<div class="salt-pagina"></div>'

  	when 'estructura'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Las humedades persistentes en los elementos estructurales tienen un efecto nefasto sobre la conservación de la estructura. Hay que reparar inmediatamente.</p>
<p>Si se ha de colgar objetos (cuadros, estanterías, muebles o luminarias) a los elementos estructurales a utilizar tacos y tornillos adecuados para el material de base.</p>
<p>Los elementos que forman parte de la estructura del edificio, paredes de carga incluidas, no se pueden alterar sin el control del Técnico de Cabecera. Esta prescripción incluye la realización de regatas en las paredes de carga y la apertura de pasos para la redistribución de espacios interiores.</p>
<p>Durante la vida útil del edificio pueden aparecer síntomas de lesiones en la estructura o en los elementos en contacto con ella. En general, estos defectos pueden tener carácter grave. En estos casos, es necesario que su Técnico de Cabecera analice las lesiones detectadas, determine su importancia y, en su caso, decida la necesidad de una intervención.</p>
<p>Relación orientativa de síntomas de lesiones con posible repercusión sobre la estructura:
<ul>
<li>Deformaciones: desplomes de paredes, fachadas y pilares.</li>
<li>Fisuras y grietas: en paredes, fachadas y pilares.</li>
<li>Manchas de óxido en elementos metálicos.</li>
</ul>
</p>
<div class="salt-pagina"></div>'

  	when 'tancaments'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Las fachadas separan la vivienda del ambiente exterior, por este motivo, deben cumplir importantes exigencias de aislamiento respecto del frío o el calor, el ruido, la entrada de aire y de humedad, la resistencia, la seguridad el robo, etc.</p>
<p>La fachada constituye la imagen externa de la casa y de sus ocupantes, conforma la calle y, por tanto, configura el aspecto de nuestra ciudad. Por ello, no puede alterarse (cerrar balcones con vidrio, abrir nuevas aperturas, instalar toldos o rótulos no apropiados) sin tener en cuenta las ordenanzas municipales y la aprobación de la Comunidad de Propietarios.</p> 
<p>Los acabados de la fachada suelen ser unos de los puntos más frágiles del edificio ya que están en contacto directo con la intemperie. Por otra parte, lo que inicialmente quizás sólo es suciedad o una degradación de la imagen estética de la fachada, se puede convertir en un peligro, ya que cualquier desprendimiento caería directamente sobre la calle.</p>
<p>Los aplacados de piedra natural se ensucian con mucha facilidad dependiendo de la porosidad de la piedra. Consulte a su Técnico de Cabecera la posibilidad de aplicar un producto protector incoloro.</p>
<p>Las paredes medianeras son aquellas que separan el edificio de los edificios vecinos. Cuando no haya edificios vecinos o sean más bajos, las medianeras quedarán a la vista y deberán estar protegidas como si fueran fachadas.</p>
<p>En los balcones y las galerías no se deben colocar cargas pesadas, tales como jardineras o materiales almacenados. También debería evitar que el agua que se utiliza para regar chorrear por la fachada.</p>
<p>Las ventanas y balcones exteriores son elementos comunes del edificio, aunque su uso sea mayoritariamente privado. Cualquier modificación de su imagen exterior (incluyendo el cambio de perfilería) deberá ser aprobada por la Comunidad de Propietarios. Sin embargo, la limpieza y el mantenimiento corresponde a los usuarios de las viviendas.</p>
<p>No se apoyarán sobre las ventanas y balcones, elementos de sujeción de andamios, poleas para levantar cargas o muebles, mecanismos de limpieza exteriores u otros objetos que puedan dañar.</p>
<p>No se deben dar golpes fuertes a las ventanas. Por otra parte, las ventanas pueden conseguir una alta estanqueidad al aire y al ruido con la colocación de burletes especialmente concebidos para este fin.</p>
<p>Los cristales se deberán limpiar con agua jabonosa, preferentemente tibia, y posteriormente se secarán. No se deben frotar con trapos secos, ya que el vidrio se rayaría.</p>
<p>En las persianas enrollables de PVC, se debe evitar forzar las lamas cuando pierdan la horizontalidad o se queden atascadas en las guías. Se debe limpiar con detergentes no alcalinos y agua caliente. Es necesario utilizar un paño suave o una esponja.</p>
<p>Una falta de aislamiento térmico puede ser la causa de la existencia de humedades de condensación. El Técnico de Cabecera deberá analizar los síntomas adecuadamente para determinar posibles defectos en el aislamiento térmico.</p>
<p>Si el aislamiento térmico se moja, por su efectividad. Por lo tanto, se debe evitar cualquier tipo de humedad que lo pueda afectar.</p>
<p>El ruido se transmite por el aire o por medio de los materiales del edificio. Puede provenir de la calle o del interior de la casa. El ruido de la calle se puede reducir mediante ventanas con doble acristalamiento o dobles ventanas. El ruido de las personas se puede reducir con la colocación de materiales aislantes o absorbentes acústicos en paredes y techos.</p>
<p>Para las reposiciones de los elementos que tengan una duración más corta que la propia fachada (juntos, protecciones, etc.) o de los cerramientos de vidrio, se utilizarán productos idénticos a los existentes o de características equivalentes que no alteren sus prestaciones iniciales.</p>
<p>Los desprendimientos de elementos de la fachada, son un riesgo, tanto para los usuarios como para los peatones.</p>
<p>Es responsabilidad del usuario, que, cuando haya síntomas de degradaciones, soplados y / o elementos rotos en las fachadas, avisar rápidamente a los responsables de mantenimiento del edificio para que se tomen las medidas oportunas. En caso de peligro inminente hay que avisar al Servicio de Bomberos.</p>
<div class="salt-pagina"></div>'

  	when 'cobertes'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Cubiertas planas:</p>
<p>Las cubiertas planas deben mantenerse limpias y sin hierbas, especialmente los sumideros, las canales y las limas. Es preferible no colocar jardineras cerca de los desagües o bien que estén elevadas del suelo para permitir el paso del agua.</p>
<p>Este tipo de cubierta sólo debe utilizarse para el uso a que haya sido proyectada. En este sentido, se evitará el almacenamiento de materiales, muebles, etc., y el vertido de productos químicos agresivos tales como aceites, disolventes o lejía.</p>
<p>Si en la cubierta se instalan nuevas antenas, equipos de aire acondicionado o, en general, aparatos que requieran ser fijados, la sujeción no debe afectar a la impermeabilización.</p>
<p>Tampoco se deben utilizar como puntos de anclaje de tensores, de barandillas metálicas o de obra, ni de conductos de evacuación de humos existentes, salvo que el Técnico de Cabecera lo autorice. Si estas nuevas instalaciones precisan de un mantenimiento periódico, se preverán en su entorno las protecciones adecuadas.</p>
<p>En caso de que se observen humedades en los pisos bajo cubierta, habrá controlarlas, ya que pueden tener un efecto negativo sobre los elementos estructurales.</p>
<p>Hay que procurar, siempre que sea posible, no caminar por encima de las cubiertas planas no transitables. Cuando sea necesario pisarlas hay que ir con cuidado para no producir desperfectos. El personal de inspección, conservación o reparación estará provisto de zapatos de suela blanda.</p>
<p>Cubiertas con pendiente:</p>
<p>Las cubiertas deben mantenerse limpias y sin hierbas, especialmente los sumideros, las canales y las limas. Se procurará, siempre que sea posible, no pisar las cubiertas en pendiente. Cuando se transite hay que tener mucho cuidado para no producir desperfectos.</p>
<p>Las cubiertas en pendiente serán accesibles sólo para su conservación. El personal encargado del trabajo irá provisto de cinturón de seguridad que sujetará a dos ganchos de servicio o en puntos fijos de la cubierta. Es recomendable que los operarios lleven zapatos con suelas blandas y antideslizantes. No se transitará sobre las cubiertas si están mojadas.</p>
<p>Si a la coberta s’instal·len noves antenes, equips d’aire condicionat o, en general, aparells que requereixin ser fixats, la subjecció no pot afectar la impermeabilització. Tampoc no s’han d’utilitzar com a punts d’ancoratge de tensors, de baranes metàl·liques o d’obra, ni de conductes d’evacuació de fums existents, llevat que un tècnic especialitzat ho autoritzi. Si aquestes noves instal·lacions necessiten d’un manteniment periòdic, caldrà preveure al seu entorn les proteccions adequades.</p>
<p>En caso de que se observen humedades en las plantas bajo cubierta, se deberán controlar, ya que pueden tener un efecto negativo sobre los elementos estructurales.</p>
<p>El musgo y los hongos se eliminan con un cepillo y si es necesario se aplicará un fungicida.</p>
<p>Los trabajos de reparación se harán siempre retirando la parte dañada para no sobrecargar la estructura.</p>
<p>Lucernarios y claraboyas:</p>
<p>Las claraboyas y tragaluces deben limpiarse con asiduidad, ya que en caso de ensuciarse reducen considerablemente la cantidad de luz que dejan pasar.</p>
<p>Por su situación dentro del edificio, deben extremarse las medidas de seguridad en el momento de limpiarlas para evitar accidentes.</p>
<div class="salt-pagina"></div>'

  	when 'particions'
  		return ''
  	when 'sanejament'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>La red de saneamiento se compone básicamente de elementos y conductos de desagüe de los aparatos de cada planta y de algunos recintos del edificio, que conectan con la red de saneamiento vertical (bajantes) y con los sumideros, arquetas, colectores , etc., hasta la red municipal u otro sistema autorizado.</p>
<p>En la red de saneamiento es muy importante conservar la instalación limpia y libre de depósitos. Se puede conseguir con un mantenimiento reducido basado en una utilización adecuada y en unos hábitos higiénicos correctos por parte de los usuarios.</p>
<p>La red de evacuación de agua, sobre todo el inodoro, no se puede utilizar como vertedero de desechos. No se pueden tirar plásticos, algodón, gomas, compresas, hojas de afeitar, bastoncillos, etc. Las sustancias y los elementos anteriores, por sí mismos o combinados, pueden taponar o, incluso, destruir por procedimientos físicos o reacciones químicas las conducciones y / o sus elementos, produciéndose derrames malolientes tales como fugas, manchas, etc.</p>
<p>Se deben revisar con frecuencia los sifones de los sumideros y comprobar que no les falte agua, para evitar que los olores de la red salgan al exterior.</p>
<p>Para desatascar los conductos no se pueden utilizar ácidos o productos que perjudiquen los desagües. Se utilizarán siempre detergentes biodegradables para evitar la creación de espumas que petrifican dentro de los sifones y las arquetas del edificio. Tampoco se verterán aguas que contengan aceites, colorantes permanentes o sustancias tóxicas. Como ejemplo, un litro de aceite mineral contamina 10.000 litros de agua.</p>
<p>Cualquier modificación en la instalación o en las condiciones de uso que puedan alterar el normal funcionamiento será realizada mediante un estudio previo y bajo la dirección de su Técnico de Cabecera.</p>
<p>Las posibles fugas se localizarán y repararán lo antes posible.</p>
<div class="salt-pagina"></div>'

  	when 'aigua'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Responsabilidades:</p>
<p>El mantenimiento de la instalación a partir del contador (no sólo desde la llave de paso de la vivienda) es a cargo de cada uno de los usuarios. El mantenimiento de las instalaciones situadas entre la llave de paso del edificio y los contadores corresponde al propietario del inmueble o en la Comunidad de Propietarios.</p>
<p>El cuarto de contadores será accesible sólo para el portero o vigilante y el personal de la compañía suministradora o de mantenimiento. Hay que vigilar que las rejas de ventilación no estén obstruidas, así como también el acceso a la cámara.</p>
<p>Precauciones:</p>
<p>Se recomienda cerrar la llave de paso de la vivienda en caso de ausencia prolongada. Si la ausencia ha sido muy larga se revisarán las juntas antes de abrir la llave de paso.</p>
<p>Todas las fugas o defectos de funcionamiento a las conducciones, los accesorios o los equipos se repararán inmediatamente.</p>
<p>Todas las canalizaciones metálicas se conectarán a la red de puesta a tierra. Está prohibido utilizar las tuberías como elementos de contacto de las instalaciones eléctricas con el suelo.</p>
<p>Para desatascar tuberías, no se deben utilizar objetos punzantes que puedan perforar la foto.</p>
<p>En caso de bajas temperaturas, se debe dejar correr el agua por las tuberías para evitar que se hiele el agua en su interior.</p>
<p>El correcto funcionamiento de la red de agua caliente es uno de los factores que influyen más decididamente en el ahorro de energía, de ahí que debe ser objeto de una mayor atención para obtener un rendimiento energético óptimo.</p>
<p>En la revisión general se comprobará el estado del aislamiento y la señalización de la red de agua, la estanqueidad de las uniones y las juntas, y el correcto funcionamiento de las llaves de paso y válvulas, y hay verificar la posibilidad de cierre total o parcial de la red.</p>
<div class="salt-pagina"></div>'

  	when 'electricitat'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>La instalación eléctrica está formada por el contador, para la derivación individual, por el cuadro general de mando y protección y por los circuitos de distribución interior. Al mismo tiempo, el cuadro general de mando y protección está formado por un interruptor de control de potencia (ICP), un interruptor diferencial (ID) y los pequeños interruptores automáticos (PIA).</p>
<p>El ICP es el mecanismo que controla la potencia que suministra la red de compañía. El ICP desconecta la instalación cuando la potencia consumida es superior a la contratada o bien cuando se produce un cortocircuito (contacto directo entre dos hilos conductores) y el PIA de su circuito no se dispara previamente.</p>
<p>El interruptor diferencial (ID) protege contra las fugas accidentales de corriente como, por ejemplo, las que se producen cuando se toca con el dedo un enchufe o cuando un hilo eléctrico toca una tubería de agua o la carcasa de la lavadora. El interruptor diferencial (ID) es indispensable para evitar accidentes. Siempre que se produce un escape salta el interruptor.</p>
<p>Cada circuito de distribución interior tiene asignado un PIA que salta cuando el consumo del circuito es superior al previsto. Este interruptor protege contra los cortocircuitos y las sobrecargas.</p>
<p>Responsabilidades:</p>
<p>El mantenimiento de la instalación eléctrica a partir del contador (y no sólo desde el cuadro general de entrada a la vivienda) es a cargo de cada uno de los usuarios.</p>
<p>El mantenimiento de la instalación entre la caja general de protección y los contadores corresponde al propietario del inmueble o en la Comunidad de Propietarios. Aunque la instalación eléctrica tiene desgastes muy pequeños, difíciles de apreciar, es conveniente realizar revisiones periódicas para comprobar el buen funcionamiento de los mecanismos y el estado del cableado, de las conexiones y del aislamiento. En la revisión general de la instalación eléctrica se debe verificar la canalización de las derivaciones individuales comprobando el estado de los conductos, fijaciones, aislamiento y tapas de registro, y verificar la ausencia de humedad.</p>
<p>El cuarto de contadores será accesible sólo para el portero o vigilante, y el personal de la compañía suministradora o de mantenimiento. Hay que vigilar que las rejas de ventilación no estén obstruidas, así como también el acceso a la cámara.</p>
<p>Precauciones:
<p>Las instalaciones eléctricas deben utilizarse con precaución por el peligro que conllevan. Está prohibido manipular los circuitos y los cuadros generales, estas operaciones deben ser efectuadas exclusivamente por personal especialista.</p>
<p>No se debe permitir a los niños manipular los aparatos eléctricos cuando estén enchufados y, en general, se debe evitar manipularlos con las manos húmedas. Se debe tener especial cuidado en las instalaciones de baños y cocinas (locales húmedos).</p>
<p>No se pueden conectar a los enchufes aparatos de potencia superior a la prevista o varios aparatos que, en conjunto, tengan una potencia superior. Si se aprecia un calentamiento de los cables o de los enchufes conectados a un determinado punto, se deben desconectar. Es síntoma de que la instalación está sobrecargada o no está preparada para recibir el aparato. Las clavijas de los enchufes deben estar bien atornilladas para evitar que hagan chispas. Las conexiones malas originan calentamientos que pueden generar un incendio.</p>
<p>Es recomendable cerrar el interruptor de control de potencia (ICP) de la vivienda en caso de ausencia prolongada. Si se deja el frigorífico en funcionamiento, no es posible desconectar el interruptor de control de potencia, pero sí cerrar los pequeños interruptores automáticos de otros circuitos.</p>
<p>Periódicamente, es recomendable pulsar el botón de prueba del diferencial (ID), el cual debe desconectar toda la instalación. Si no la desconecta, el cuadro no ofrece protección y habrá que avisar al instalador.</p>
<p>Para limpiar las luces y las placas de los mecanismos eléctricos se debe desconectar la instalación eléctrica. Se deben limpiar con un paño ligeramente humedecido con agua y detergente. La electricidad se conectará una vez se hayan secado las placas.</p>
<div class="salt-pagina"></div>'

  	when 'climatitzacio'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Se deben leer y seguir las instrucciones de la instalación antes de ponerla en funcionamiento por primera vez.</p>
<p>El correcto funcionamiento de la instalación es uno de los factores que influyen más decisivamente en el ahorro de energía, por lo tanto se debe mantener con cuidado para obtener un rendimiento óptimo.</p>
<p>Hay que informar al personal de mantenimiento si se detectan fugas de agua en los aparatos emisores o en las conducciones y se procederá a su reparación inmediata. En su caso se avisará del hecho a la Propiedad.</p>
<p>Los aparatos emisores de calor no deben taparse con ningún mueble u objeto.</p>
<p>Después de una fuga de gas, no se puede encender la calefacción hasta que el instalador haya revisada.</p>
<div class="salt-pagina"></div>'

  	when 'gas'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>El grado de peligrosidad de las instalaciones de gas combustible es superior a cualquier otra. Por esta razón se extremarán las medidas de seguridad. Cualquier intervención sobre la instalación o sobre los aparatos de consumo debe estar hecha por una empresa especializada.</p>
<p>Hay que seguir las instrucciones de mantenimiento de los aparatos de gas que proporcionan sus fabricantes.</p>
<p>No se pueden observar las chimeneas de evacuación de humos, ni se pueden dejar objetos cerca de focos de calor o superficies calientes.</p>
<p>No se pueden tapar los agujeros de ventilación de los espacios que contienen instalaciones de gas. Debe haber ventilación tanto en la parte alta como en la parte baja del espacio.</p>
<p>Los gases propano y butano son más pesados que el aire y, por tanto, en caso de fuga van hacia abajo. El gas natural es menos pesado que el aire y, por tanto, en caso de fuga va hacia arriba.</p>
<p>Si se quiere dar suministro a otros aparatos que los de construcción original se debe pedir permiso a la Propiedad. La instalación del nuevo aparato debe hacer una empresa autorizada.</p>
<p>Los quemadores deben mantenerse limpios de depósitos y residuos de la combustión. Se comprobarán periódicamente las emisiones de gases contaminantes y si es necesario se harán los ajustes y reparaciones en los aparatos para que estas se mantengan dentro de los parámetros establecidos.</p>
<p>Se recomienda que en ausencias largas se cierre la llave de paso general de la instalación de gas. Durante la noche es mejor hacer lo mismo, siempre que no quede en funcionamiento ningún aparato de gas.</p>
<p>El mantenimiento de las instalaciones situadas entre el grifo de entrada del inmueble y el contador corresponde a la Propiedad.</p>
<p>Los tubos de gas no debe usarse para las tomas de tierra de los aparatos eléctricos ni tampoco para colgar objetos.</p>
<p>El cuarto de contadores sólo será accesible al portero, al vigilante, o al personal de la compañía suministradora y el de mantenimiento. Hay que vigilar que tanto las rejas de ventilación como el acceso a la cámara no queden obstruidos.</p>
<p>Si se detecta una fuga de gas no debe abrirse ninguna luz ni accionar interruptores o conectar aparatos eléctricos. La conexión o desconexión de aparatos eléctricos puede provocar chispas que a su vez pueden provocar la deflagración del gas acumulado. Tampoco se pueden utilizar encendedores ni encender cerillas. En estos casos se intentará cerrar la llave de paso del gas y luego se ventilará el recinto donde se ha producido la fuga abriendo puertas y ventanas de par en par. Finalmente se debe avisar de la avería a una empresa instaladora autorizada o bien al servicio de urgencias de la empresa suministradora para que localice la avería.</p>
<div class="salt-pagina"></div>'

  	when 'ventilacio'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Se deben ventilar los espacios interiores para evitar humedades de condensación, especialmente si la calefacción es de estufas de gas butano. La ventilación se realizará preferentemente en horas de sol, y por espacio de 20 o 30 minutos.</p>
<p>Los hongos que aparecen en los puntos más fríos de los recintos tienen su origen en humedades de condensación y no en goteras, como se cree normalmente. La limpieza debe realizarse con productos fungicidas, pero hay que tener en cuenta que de no resolver el problema de origen, los hongos volverán a aparecer si no se mejora la ventilación o el aislamiento térmico de la pieza.</p>
<p>En caso de aumentar el aislamiento térmico de forma puntual sin reducir la humedad ambiental, la condensación se producirá en otro punto frío provocando deterioros de los revestimientos.</p>
<p>No se permite conectar extractores a conductos de evacuación de gases de calderas de calefacción.</p>
<p>Hay que leer y seguir las instrucciones de los aparatos de extracción mecánica.</p>
<div class="salt-pagina"></div>'

  	when 'incendis'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Las instrucciones de uso de los componentes de la instalación figuran en los mismos aparatos. Todos los componentes de la instalación deben estar en su sitio y al alcance. No se han de ocultar.</p>
<p>Queda completamente prohibido hacer un uso indebido de los elementos de la instalación contra incendios.</p>
<p>Se debe mantener la instalación de protección al fuego en condiciones reglamentarias. Todas las tareas de mantenimiento, revisión y reparación deben estar hechas por una empresa autorizada.</p>
<p>En caso de incendio:</p>
<p>Si se produce un conato de incendio, hay que avisar a los bomberos ya los ocupantes del inmueble inmediatamente. Durante los primeros minutos de inicio del fuego, es posible intentar controlarlo con los medios de que disponga el edificio (mangueras, extintores). En este caso siempre deben actuar dos personas con un extintor cada una o con una manguera atacando al fuego. Nunca se debe actuar solo. Si pasados unos instantes no se ha dominado el fuego, se aconseja evacuar el edificio siguiendo el plan previsto de evacuación del inmueble.</p>
<p>Si en algún conato de incendio se ha producido una descarga parcial o total de un extintor, se han desarrollado mangueras o se han accionado pulsadores de disparadores de alarma, hay que hacerlo saber al conserje o el personal de mantenimiento del edificio para que lleven a cabo las revisiones pertinentes y restablezcan el estado normal de la instalación.</p>
<div class="salt-pagina"></div>'

  	when 'ascensor'
  		return '<p class="apartat-sistema">Instrucciones de uso:</p>
<p>Los ascensores no pueden ser utilizados por niños que no vayan acompañados de personas adultas.</p>
<p>Si se observa que falla algún mecanismo, se debe prestar el servicio y avisar al encargado del mantenimiento.</p>
<p>Los ascensores no se pueden utilizar como montacargas.</p>
<p>No se puede fumar dentro de la cabina del ascensor.</p>
<p>El conserje, portero, presidente de la comunidad o a quien el presidente delegue, es responsable del seguimiento de estas recomendaciones de uso.</p>
<p>En caso de avería, de falta de suministro eléctrico, etc. es obligatorio tener conectada la cabina con la empresa de mantenimiento.</p>
<p>Personas atrapadas en el interior por una avería</p>
<p>Si alguna persona queda atrapada en el interior de la cabina debido a una avería, es fundamental no perder la calma. Hay que pulsar el timbre de alarma de la botonera de cabina o comunicar el hecho por teléfono, si se dispone de uno. Nunca se debe intentar abrir las puertas manualmente para salir de la cabina.</p>
<p>Si la avería es un corte de suministro eléctrico, la cabina se detendrá y se encenderá la luz de emergencia. Hay que recordar que en este supuesto el ascensor es completamente seguro. Si en caso de avería no funciona el timbre de alarma, hay que llamar periódicamente para que se sepa la presencia de una persona en la cabina. Ninguna persona atrapada en el interior de una cabina debe intentar salir forzando las puertas, y menos cuando el ascensor se haya parado entre dos plantas.</p>
<p>Las personas que están fuera del ascensor no deben manipular ningún mecanismo ni ninguna puerta. Se limitarán a avisar a la empresa de mantenimiento o, en un caso grave, a los bomberos. Si es posible, conviene informar de lo que pasa a la persona atrapada vigilando que mantenga la calma.</p>
<div class="salt-pagina"></div>'

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

  def operacions_pdf_es(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema)
    llistat_operacions = '<div class="espaiador"></div><p class="apartat-sistema">Instrucciones de mantenimiento:</p>'
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      llistat_operacions = llistat_operacions + '
      <div class="taula-container">
      <table class="taula-dades">
			  <tbody>
			    <tr>
			      <td><span class="titol-taula">Descripción:</span><br/>' + operacio.descripcio_es + '</td>
			    </tr>
			  </tbody>
			</table>
			<table class="taula-dades-final">
				<tbody>
			    <tr>
			    	<td class="taula-dos-columnes"><span class="titol-taula">Periodicidad:</span><br/>' + operacio.periodicitat_text_es + '</td>
			      <td class="taula-dos-columnes"><span class="titol-taula">Responsable:</span><br/>' + operacio.responsable_es + '</td>
			    </tr>
			  </tbody>
			</table>
      </div>'			     
    end
    return llistat_operacions
  end

  def operacions_manual_habitatge_pdf_es(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema, :manual_habitatge => true)
    llistat_operacions = ''
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      llistat_operacions = llistat_operacions + '
      <div class="taula-container">
      <table class="taula-dades">
			  <tbody>
			    <tr>
			      <td><span class="titol-taula">Descripción:</span><br/>' + operacio.descripcio_es + '</td>
			    </tr>
			  </tbody>
			</table>
			<table class="taula-dades-final">
				<tbody>
			    <tr>
			    	<td class="taula-dos-columnes"><span class="titol-taula">Periodicidad:</span><br/>' + operacio.periodicitat_text_es + '</td>
			      <td class="taula-dos-columnes"><span class="titol-taula">Responsable:</span><br/>' + operacio.responsable_es + '</td>
			    </tr>
			  </tbody>
			</table>
      </div>'
    end
    return llistat_operacions
  end

  def text_manteniment_pdf_es
  	text_manteniment = ''
	  existeix_sistema = comprovacio_sistema('fonamentacio')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Cimentación')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Fonamentacio, 'fonamentacio')
	    text_manteniment = text_manteniment + instruccions_pdf_es('fonamentacio')
	    text_manteniment = text_manteniment + operacions_pdf_es('fonamentacio')
	  end
	  existeix_sistema = comprovacio_sistema('estructura')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Estructura')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Estructura, 'estructura')
	    text_manteniment = text_manteniment + instruccions_pdf_es('estructura')
	    text_manteniment = text_manteniment + operacions_pdf_es('estructura')
	  end
	  existeix_sistema = comprovacio_sistema('tancaments')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Cerramientos verticales')
	    text_manteniment = text_manteniment + descripcio_pdf_es(TancamentsVertical, 'tancaments')
	    text_manteniment = text_manteniment + instruccions_pdf_es('tancaments')
	    text_manteniment = text_manteniment + operacions_pdf_es('tancaments')
	  end
	  existeix_sistema = comprovacio_sistema('cobertes')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Cubiertas')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Coberta, 'coberta')
	    text_manteniment = text_manteniment + instruccions_pdf_es('cobertes')
	    text_manteniment = text_manteniment + operacions_pdf_es('cobertes')
	  end
	  existeix_sistema = comprovacio_sistema('particions')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Particiones y acabados')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Particio, 'particions')
	    text_manteniment = text_manteniment + instruccions_pdf_es('particions')
	    text_manteniment = text_manteniment + operacions_pdf_es('particions')
	  end
	  existeix_sistema = comprovacio_sistema('sanejament')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Saneamiento')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Sanejament, 'sanejament')
	    text_manteniment = text_manteniment + instruccions_pdf_es('sanejament')
	    text_manteniment = text_manteniment + operacions_pdf_es('sanejament')
	  end
	  existeix_sistema = comprovacio_sistema('aigua')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Suministro de agua')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Aigua, 'aigua')
	    text_manteniment = text_manteniment + instruccions_pdf_es('aigua')
	    text_manteniment = text_manteniment + operacions_pdf_es('aigua')
	  end
	  existeix_sistema = comprovacio_sistema('electricitat')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Instalación eléctrica')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Electricitat, 'electricitat')
	    text_manteniment = text_manteniment + instruccions_pdf_es('electricitat')
	    text_manteniment = text_manteniment + operacions_pdf_es('electricitat')
	  end
	  existeix_sistema = comprovacio_sistema('climatitzacio')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('ACS, calefacción y refrigeración')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Climatitzacio, 'climatitzacio')
	    text_manteniment = text_manteniment + instruccions_pdf_es('climatitzacio')
	    text_manteniment = text_manteniment + operacions_pdf_es('climatitzacio')
	  end
	  existeix_sistema = comprovacio_sistema('gas')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Instalación de gas')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Ga, 'gas')
	    text_manteniment = text_manteniment + instruccions_pdf_es('gas')
	    text_manteniment = text_manteniment + operacions_pdf_es('gas')
	  end
	  existeix_sistema = comprovacio_sistema('ventilacio')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Ventilación')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Ventilacio, 'ventilacio')
	    text_manteniment = text_manteniment + instruccions_pdf_es('ventilacio')
	    text_manteniment = text_manteniment + operacions_pdf_es('ventilacio')
	  end
	  existeix_sistema = comprovacio_sistema('incendis')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Protección contra incendios')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Incendi, 'incendis')
	    text_manteniment = text_manteniment + instruccions_pdf_es('incendis')
	    text_manteniment = text_manteniment + operacions_pdf_es('incendis')
	  end
	  existeix_sistema = comprovacio_sistema('ascensor')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Ascensores')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Ascensor, 'ascensors')
	    text_manteniment = text_manteniment + instruccions_pdf_es('ascensor')
	    text_manteniment = text_manteniment + operacions_pdf_es('ascensor')
	  end
	  existeix_sistema = comprovacio_sistema('telecomunicacions')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Instalación de telecomunicaciones')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Telecomunicacio, 'telecomunicacions')
	    text_manteniment = text_manteniment + instruccions_pdf_es('telecomunicacions')
	    text_manteniment = text_manteniment + operacions_pdf_es('telecomunicacions')
	  end
	  existeix_sistema = comprovacio_sistema('especials')
	  if existeix_sistema == true
	    text_manteniment = text_manteniment + titol_pdf_es('Instalaciones especiales')
	    text_manteniment = text_manteniment + descripcio_pdf_es(Especial, 'especials')
	    text_manteniment = text_manteniment + instruccions_pdf_es('especials')
	    text_manteniment = text_manteniment + operacions_pdf_es('especials')
	  end
	  return text_manteniment
  end

  def text_manual_habitatge_pdf_es
    text_manteniment = ''
    existeix_sistema = comprovacio_sistema_manual('estructura')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Estructura')
      text_manteniment = text_manteniment + descripcio_pdf_es(Estructura, 'estructura')
      text_manteniment = text_manteniment + instruccions_pdf_es('estructura')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('estructura')
    end
    existeix_sistema = comprovacio_sistema_manual('tancaments')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Cerramientos verticales')
      text_manteniment = text_manteniment + descripcio_pdf_es(TancamentsVertical, 'tancaments')
      text_manteniment = text_manteniment + instruccions_pdf_es('tancaments')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('tancaments')
    end
    existeix_sistema = comprovacio_sistema_manual('cobertes')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Azoteas y terrazas')
      text_manteniment = text_manteniment + descripcio_pdf_es(Coberta, 'coberta')
      text_manteniment = text_manteniment + instruccions_pdf_es('cobertes')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('cobertes')
    end
    existeix_sistema = comprovacio_sistema_manual('particions')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Particiones y acabados')
      text_manteniment = text_manteniment + descripcio_pdf_es(Particio, 'particions')
      text_manteniment = text_manteniment + instruccions_pdf_es('particions')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('particions')
    end
    existeix_sistema = comprovacio_sistema_manual('sanejament')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Saneamiento')
      text_manteniment = text_manteniment + descripcio_pdf_es(Sanejament, 'sanejament')
      text_manteniment = text_manteniment + instruccions_pdf_es('sanejament')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('sanejament')
    end
    existeix_sistema = comprovacio_sistema_manual('aigua')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Suministro de agua')
      text_manteniment = text_manteniment + descripcio_pdf_es(Aigua, 'aigua')
      text_manteniment = text_manteniment + instruccions_pdf_es('aigua')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('aigua')
    end
    existeix_sistema = comprovacio_sistema_manual('electricitat')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Instalación eléctrica')
      text_manteniment = text_manteniment + descripcio_pdf_es(Electricitat, 'electricitat')
      text_manteniment = text_manteniment + instruccions_pdf_es('electricitat')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('electricitat')
    end
    existeix_sistema = comprovacio_sistema_manual('climatitzacio')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('ACS, calefacción y refrigeración')
      text_manteniment = text_manteniment + descripcio_pdf_es(Climatitzacio, 'climatitzacio')
      text_manteniment = text_manteniment + instruccions_pdf_es('climatitzacio')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('climatitzacio')
    end
    existeix_sistema = comprovacio_sistema_manual('gas')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Instalación de gas')
      text_manteniment = text_manteniment + descripcio_pdf_es(Ga, 'gas')
      text_manteniment = text_manteniment + instruccions_pdf_es('gas')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('gas')
    end
    existeix_sistema = comprovacio_sistema_manual('ventilacio')
    if existeix_sistema == true
      text_manteniment = text_manteniment + titol_pdf_es('Ventilación')
      text_manteniment = text_manteniment + descripcio_pdf_es(Ventilacio, 'ventilacio')
      text_manteniment = text_manteniment + instruccions_pdf_es('ventilacio')
      text_manteniment = text_manteniment + operacions_manual_habitatge_pdf_es('ventilacio')
    end
    return text_manteniment
  end


  def espdf_arxiu_documents_edifici_nou_es
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
      arxiu = ChecklistNouPlurifamiliar.where(:edifici_id => @edifici.id).last
    elsif @edifici.tipus_edifici == 'nou_unifamiliar'
      arxiu = ChecklistNouUnifamiliar.where(:edifici_id => @edifici.id).last
    end
    pdf_titols_arxiu = ''

    def titol_apartat_arxiu(text_titol)
      return '<p class="subtitol-seccio-document">' + text_titol + '</p><div class="salt-pagina"></div>'
    end

    if arxiu.llicencies_preceptives == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Licencias preceptivas")
    end
    if arxiu.certificat_final_obra == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificado final de obra")
    end
    if arxiu.acta_recepcio_obra == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Acta de recepción definitiva de la obra")
    end
    if arxiu.escriptura_publica == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Escritura pública de declaración de obra nueva")
    end
    if arxiu.documents_garantia == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documentos acreditativos de garantía")
    end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
	    if arxiu.documents_garantia_parts_comunes == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documentos de garantía de instalaciones de partes comunes")
	    end
	  end
    if arxiu.certificacio_energetica == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificación energética")
    end
    if arxiu.polissa_assegurances == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Pólizas de seguros")
    end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
	    if arxiu.escriptura_propietat_horitzontal == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Escritura de división en régimen de propiedad horizontal")
	    end
	    if arxiu.estatus_comunitat == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Estatutos de la comunidad de propietarios")
	    end
	  end
    if arxiu.cedules_regims_juridics == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Cédulas de declaración de regímenes jurídicos especiales o calificaciones de viviendas protegidas")
    end
    if arxiu.carregues_reals == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Cargas reales existentes")
    end
    if arxiu.documents_acreditatius_ajuts == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documentos acreditativos de las ayudas y beneficios otorgados en el edificio")
    end
    if arxiu.documents_justificacio_operacions == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documentos de justificación de la realización de operaciones de reparación, mantenimiento y rehabilitación")
    end
    if @edifici.tipus_edifici == 'nou_plurifamiliar'
	    if arxiu.certificat_final_obra_instalacions == true
	      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificados final de obra de las instalaciones comunes de baja tensión, gases combustibles, productos petrolíferos o instalaciones térmicas")
	    end
	  end
    if arxiu.declaracions_ce_ascensors == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Declaraciones CE que reconocen la conformidad de los ascensores instalados")
    end

    return pdf_titols_arxiu
  end

  def espdf_arxiu_documents_edifici_existent_es
    arxiu = ChecklistExistentPlurifamiliar.where(:edifici_id => @edifici.id).last
    pdf_titols_arxiu = ''

    def titol_apartat_arxiu(text_titol)
      return '<p class="subtitol-seccio-document">' + text_titol + '</p><div class="salt-pagina"></div>'
    end

    if arxiu.iite == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Informe de inspección técnica obligatoria (IITE)")
    end
    if arxiu.document_lliurament_iite == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documento acreditativo de la entrega a la Administración de los datos básicos de la IITE")
    end
    if arxiu.comunicat_ens_local == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("El comunicado al ente local del municipio al que pertenece el edificio en caso de situación de riesgo para las personas")
    end
    if arxiu.programa_rehabilitacio == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Programa de rehabilitación que adopte las medidas correctoras")
    end
    if arxiu.certificat_final_obra == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificados de final de obra de todas las obras que se ejecuten en el edificio")
    end
    if arxiu.certificat_aptitud == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificado de aptitud")
    end
    if arxiu.certificacio_energetica == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificado de eficiencia energética del edificio")
    end
    if arxiu.documents_justificatius_operacions == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Documentos que justifiquen la realización de operaciones de reparación, mantenimiento y rehabilitación de carácter obligatorio, así como la identificación de las empresas o profesionales que las han realizado y las garantías que se han dado")
    end
    if arxiu.pressupostos_obres == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Presupuestos y contratos de obras, mantenimientos y honorarios profesionales")
    end
    if arxiu.certificats_instalacions_comunes == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificados de inscripción en el Registro de instalaciones técnicas de seguridad industrial de Cataluña de las instalaciones comunes del edificio de baja tensión, gases combustibles, instalaciones petrolíferas, instalaciones térmicas y de ascensores que se hayan realizado")
    end
    if arxiu.certificats_inspeccions_tecniques == true
      pdf_titols_arxiu = pdf_titols_arxiu + titol_apartat_arxiu("Certificados de inspecciones técnicas de las instalaciones comunes sometidas a reglamentación de seguridad industrial")
    end

    return pdf_titols_arxiu
  end

end