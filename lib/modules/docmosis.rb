module Docmosis
	# Agents
  def items_promotor 
    llistat_promotors = Array.new
    @edifici.promotors.each do |promotor|
      llistat_promotors << {
        "nom_promotor"=>"#{promotor.nom_promotor}", 
        "nif_promotor"=>"#{promotor.nif_promotor}", 
        "adreca_promotor"=>"#{promotor.adreca_promotor}", 
        "cp_promotor"=>"#{promotor.cp_promotor}",
        "poblacio_promotor"=>"#{promotor.poblacio_promotor}", 
        "provincia_promotor"=>"#{promotor.provincia_promotor}", 
        "pais_promotor"=>"#{promotor.pais_promotor}", 
        "telefon_promotor"=>"#{promotor.telefon}", 
        "email_promotor"=>"#{promotor.email}", 
        "web_promotor"=>"#{promotor.web}"
      }
    end
    llistat_promotors.to_json
    return llistat_promotors
  end

  def items_projectista
    llistat_projectistes = Array.new
    @edifici.projectistes.each do |projectista|
      llistat_projectistes << {
        "nom_projectista"=>"#{projectista.nom_projectista}",
        "titulacio_projectista"=>"#{projectista.titulacio_projectista}",
        "rao_social_projectista"=>"#{projectista.rao_social_projectista}",
        "nif_projectista"=>"#{projectista.nif_projectista}",
        "telefon_projectista"=>"#{projectista.telefon}", 
        "email_projectista"=>"#{projectista.email}", 
        "web_projectista"=>"#{projectista.web}"
      }
    end
    llistat_projectistes.to_json
    return llistat_projectistes
  end

  def items_colaborador
    llistat_colaboradors = Array.new
    @edifici.colaboradors.each do |colaborador|
      llistat_colaboradors << {
        "nom_colaborador"=>"#{colaborador.nom_colaborador}",
        "titulacio_colaborador"=>"#{colaborador.titulacio_colaborador}",
        "rao_social_colaborador"=>"#{colaborador.rao_social_colaborador}",
        "nif_colaborador"=>"#{colaborador.nif_colaborador}",
        "ambit_colaboracio"=>"#{colaborador.ambit_colaboracio}",
        "projecte_parcial"=>"#{colaborador.projecte_parcial}",
        "telefon_colaborador"=>"#{colaborador.telefon}",
        "email_colaborador"=>"#{colaborador.email}",
        "web_colaborador"=>"#{colaborador.web}"
      }
    end
    llistat_colaboradors.to_json
    return llistat_colaboradors
  end

  def items_constructor
    llistat_constructors = Array.new
    @edifici.constructors.each do |constructor|
      llistat_constructors << {
        "nom_constructor"=>"#{constructor.nom_constructor}",
        "nif_constructor"=>"#{constructor.nif_constructor}",
        "adreca_constructor"=>"#{constructor.adreca_constructor}",
        "cp_constructor"=>"#{constructor.cp_constructor}",
        "poblacio_constructor"=>"#{constructor.poblacio_constructor}",
        "provincia_constructor"=>"#{constructor.provincia_constructor}",
        "pais_constructor"=>"#{constructor.pais_constructor}",
        "telefon_constructor"=>"#{constructor.telefon}",
        "email_constructor"=>"#{constructor.email}",
        "web_constructor"=>"#{constructor.web}"
      }
    end
    llistat_constructors.to_json
    return llistat_constructors
  end

  def items_director
    llistat_directors = Array.new
    @edifici.directors.each do |director|
      llistat_directors << {
        "nom_director"=>"#{director.nom_director}",
        "titulacio_director"=>"#{director.titulacio_director}",
        "rao_social_director"=>"#{director.rao_social_director}",
        "nif_director"=>"#{director.nif_director}",
        "telefon_director"=>"#{director.telefon}",
        "email_director"=>"#{director.email}",
        "web_director"=>"#{director.web}"
      }
    end
    llistat_directors.to_json
    return llistat_directors
  end

  def items_director_execucio
    llistat_directors_execucio = Array.new
    @edifici.execucio_directors.each do |director_execucio|
      llistat_directors_execucio << {
        "nom_director_execucio"=>"#{director_execucio.nom_director_execucio}",
        "titulacio_director_execucio"=>"#{director_execucio.titulacio_director_execucio}",
        "rao_social_director_execucio"=>"#{director_execucio.rao_social_director_execucio}",
        "nif_director_execucio"=>"#{director_execucio.nif_director_execucio}",
        "telefon_director_execucio"=>"#{director_execucio.telefon}",
        "email_director_execucio"=>"#{director_execucio.email}",
        "web_director_execucio"=>"#{director_execucio.web}"
      }
    end
    llistat_directors_execucio.to_json
    return llistat_directors_execucio
  end

  def items_coordinador
    llistat_coordinadors = Array.new
    @edifici.coordinadors.each do |coordinador|
      llistat_coordinadors << {
        "nom_coordinador"=>"#{coordinador.nom_coordinador}",
        "titulacio_coordinador"=>"#{coordinador.titulacio_coordinador}",
        "rao_social_coordinador"=>"#{coordinador.rao_social_coordinador}",
        "nif_coordinador"=>"#{coordinador.nif_coordinador}",
        "telefon_coordinador"=>"#{coordinador.telefon}",
        "email_coordinador"=>"#{coordinador.email}",
        "web_coordinador"=>"#{coordinador.web}"
      }
    end
    llistat_coordinadors.to_json
    return llistat_coordinadors
  end

  def items_laboratori
    llistat_laboratoris = Array.new
    @edifici.laboratoris.each do |laboratori|
      llistat_laboratoris << {
        "nom_laboratori"=>"#{laboratori.nom_laboratori}",
        "nif_laboratori"=>"#{laboratori.nif_laboratori}",
        "telefon_laboratori"=>"#{laboratori.telefon}",
        "email_laboratori"=>"#{laboratori.email}",
        "web_laboratori"=>"#{laboratori.web}"
      }
    end
    llistat_laboratoris.to_json
    return llistat_laboratoris
  end

  def items_entitat_control
    llistat_entitat_controls = Array.new
    @edifici.entitat_controls.each do |entitat_control|
      llistat_entitat_controls << {
        "nom_entitat_control"=>"#{entitat_control.nom_entitat_control}",
        "nif_entitat_control"=>"#{entitat_control.nif_entitat_control}",
        "adreca_entitat_control"=>"#{entitat_control.adreca_entitat_control}",
        "cp_entitat_control"=>"#{entitat_control.cp_entitat_control}",
        "poblacio_entitat_control"=>"#{entitat_control.poblacio_entitat_control}",
        "provincia_entitat_control"=>"#{entitat_control.provincia_entitat_control}",
        "pais_entitat_control"=>"#{entitat_control.pais_entitat_control}",
        "telefon_entitat_control"=>"#{entitat_control.telefon}",
        "email_entitat_control"=>"#{entitat_control.email}",
        "web_entitat_control"=>"#{entitat_control.web}"
      }
    end
    llistat_entitat_controls.to_json
    return llistat_entitat_controls
  end

  def items_subministrador
    llistat_subministradors = Array.new
    @edifici.subministradors.each do |subministrador|
      llistat_subministradors << {
        "nom_subministrador"=>"#{subministrador.nom_subministrador}",
        "nif_subministrador"=>"#{subministrador.nif_subministrador}",
        "adreca_subministrador"=>"#{subministrador.adreca_subministrador}",
        "cp_subministrador"=>"#{subministrador.cp_subministrador}",
        "poblacio_subministrador"=>"#{subministrador.poblacio_subministrador}",
        "provincia_subministrador"=>"#{subministrador.provincia_subministrador}",
        "pais_subministrador"=>"#{subministrador.pais_subministrador}",
        "telefon_subministrador"=>"#{subministrador.telefon}",
        "email_subministrador"=>"#{subministrador.email}",
        "web_subministrador"=>"#{subministrador.web}"
      }
    end
    llistat_subministradors.to_json
    return llistat_subministradors
  end

  def items_subcontractista
    llistat_subcontractistes = Array.new
    @edifici.industrials.each do |industrial|
      llistat_subcontractistes << {
        "nom_industrial"=>"#{industrial.nom_industrial}",
        "nif_industrial"=>"#{industrial.nif_industrial}",
        "adreca_industrial"=>"#{industrial.adreca_industrial}",
        "cp_industrial"=>"#{industrial.cp_industrial}",
        "poblacio_industrial"=>"#{industrial.poblacio_industrial}",
        "provincia_industrial"=>"#{industrial.provincia_industrial}",
        "pais_industrial"=>"#{industrial.pais_industrial}",
        "telefon_industrial"=>"#{industrial.telefon}",
        "email_industrial"=>"#{industrial.email}",
        "web_industrial"=>"#{industrial.web}"
      }
    end
    llistat_subcontractistes.to_json
    return llistat_subcontractistes
  end

  # Dades administratives i jurídiques

  def items_llicencies
    llistat_llicencies = Array.new
    @edifici.llicencies.each do |llicencia|
      llistat_llicencies << {
        "classe"=>"#{llicencia.classe}",
        "data_llicencia"=>"#{llicencia.data_llicencia}"
      }
    end
    llistat_llicencies.to_json
    return llistat_llicencies
  end

  def items_declaracions
    llistat_declaracions = Array.new
    @edifici.declaracions.each do |declaracio|
      llistat_declaracions << {
        "notari"=>"#{declaracio.notari}",
        "n_protocol"=>"#{declaracio.n_protocol}",
        "data_declaracio"=>"#{declaracio.data_declaracio}"
      }
    end
    llistat_declaracions.to_json
    return llistat_declaracions
  end

  def items_regim_propietats
    llistat_regim_propietats = Array.new
    @edifici.regim_propietats.each do |regim_propietat|
      llistat_regim_propietats << {
        "tipus_regim_propietat"=>"#{regim_propietat.tipus_regim_propietat}",
        "document_escriptura"=>"#{regim_propietat.document_escriptura}"
      }
    end
    llistat_regim_propietats.to_json
    return llistat_regim_propietats
  end

  def items_regim_especials
    llistat_regim_especials = Array.new
    @edifici.regim_especials.each do |regim_especial|
      llistat_regim_especials << {
        "tipus_regim_especial"=>"#{regim_especial.tipus_regim_especial}",
        "referencia_document"=>"#{regim_especial.referencia_document}"
      }
    end
    llistat_regim_especials.to_json
    return llistat_regim_especials
  end

  def items_carregues
    llistat_carregues = Array.new
    @edifici.carregues.each do |carrega|
      llistat_carregues << {
        "tipus_carrega"=>"#{carrega.tipus_carrega}",
        "document_carrega"=>"#{carrega.document_carrega}"
      }
    end
    llistat_carregues.to_json
    return llistat_carregues
  end

  def items_entitats
    llistat_entitats = Array.new
    @edifici.entitats.each do |entitat|
      llistat_entitats << {
        "nom_entitat"=>"#{entitat.nom_entitat}",
        "superficie"=>"#{entitat.superficie}",
        "destinacio"=>"#{entitat.destinacio}",
        "quota"=>"#{entitat.quota}"
      }
    end
    llistat_entitats.to_json
    return llistat_entitats
  end

  def items_garantia_promotors
    llistat_garantia_promotors = Array.new
    @edifici.garantia_promotors.each do |garantia_promotor|
      llistat_garantia_promotors << {
        "venciment"=>"#{garantia_promotor.venciment}",
        "tipus"=>"#{garantia_promotor.tipus}",
        "referencia"=>"#{garantia_promotor.referencia}"
      }
    end
    llistat_garantia_promotors.to_json
    return llistat_garantia_promotors
  end

  def items_garantia_constructors
    llistat_garantia_constructors = Array.new
    @edifici.garantia_constructors.each do |garantia_constructor|
      llistat_garantia_constructors << {
        "venciment"=>"#{garantia_constructor.venciment}",
        "tipus"=>"#{garantia_constructor.tipus}",
        "referencia"=>"#{garantia_constructor.referencia}"
      }
    end
    llistat_garantia_constructors.to_json
    return llistat_garantia_constructors
  end

  def items_garantia_instalacions
    llistat_garantia_instalacions = Array.new
    @edifici.garantia_instalacions.each do |garantia_instalacio|
      llistat_garantia_instalacions << {
        "venciment"=>"#{garantia_instalacio.venciment}",
        "tipus"=>"#{garantia_instalacio.tipus}",
        "instalacio"=>"#{garantia_instalacio.instalacio}",
        "empresa"=>"#{garantia_instalacio.empresa}"
      }
    end
    llistat_garantia_instalacions.to_json
    return llistat_garantia_instalacions
  end

  def items_energia_certificats
    llistat_energia_certificats = Array.new
    @edifici.energia_certificats.each do |energia_certificat|
      llistat_energia_certificats << {
        "numero_registre"=>"#{energia_certificat.numero_registre}",
        "vigencia"=>"#{energia_certificat.vigencia}",
        "qualificacio_energetica"=>"#{energia_certificat.qualificacio_energetica}",
        "consum_energia_primaria"=>"#{energia_certificat.consum_energia_primaria}",
        "emissions_co2"=>"#{energia_certificat.emissions_co2}"
      }
    end
    llistat_energia_certificats.to_json
    return llistat_energia_certificats
  end


  # Sistemes
  # Primer comprovem si hem de posar o no cada un dels sistemes, comprovant si el sistema té operacions associades
  
  def comprovacio_sistema(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema)
    if referencies.count > 0
      return true
    else
      return false
    end
  end

  def comprovacio_sistema_manual(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema, :manual_habitatge => true)
    if referencies.count > 0
      return true
    else
      return false
    end
  end

  def items_sistemes(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema)
    llistat_operacions = Array.new
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      llistat_operacions << {
        "descripcio"=>"#{operacio.descripcio_ca}",
        "periodicitat"=>"#{operacio.periodicitat_text_ca}",
        "responsable"=>"#{operacio.responsable_ca}"
      }
    end
    llistat_operacions.to_json
    return llistat_operacions
  end

  def items_sistemes_manual(sistema)
    referencies = Referencia.where(:edifici_id => @edifici.id, :sistema => sistema, :manual_habitatge => true)
    llistat_operacions = Array.new
    referencies.each do |referencia|
      operacio = Operacio.find(referencia.operacio_id)
      llistat_operacions << {
        "descripcio"=>"#{operacio.descripcio_ca}",
        "periodicitat"=>"#{operacio.periodicitat_text_ca}",
        "responsable"=>"#{operacio.responsable_ca}"
      }
    end
    llistat_operacions.to_json
    return llistat_operacions
  end

  def comprovacio_coberta_plana
    coberta = Coberta.where(:edifici_id => @edifici.id).last
    if (coberta.terrat_transitable == true || coberta.terrat_no_transitable == true || coberta.terrat_tradicional == true || coberta.terrat_invertida == true)
      return true
    else
      return false
    end
  end

  def comprovacio_coberta_inclinada
    coberta = Coberta.where(:edifici_id => @edifici.id).last
    if (coberta.coberta_teula_arab == true || coberta.coberta_teula_plana == true || coberta.coberta_teula_ciment == true || coberta.coberta_pissarra == true || coberta.coberta_fibrociment == true || coberta.coberta_asfaltica == true || coberta.coberta_xapa_acer == true || coberta.coberta_xapa_coure == true)
      return true
    else
      return false
    end
  end

  def comprovacio_lluernes
    coberta = Coberta.where(:edifici_id => @edifici.id).last
    if (coberta.lluernes_fixes == true) || coberta.lluernes_practicables == true
      return true
    else
      return false
    end
  end

  # Descripció constructiva

  def descripcio_constructiva(sistema)
    sistema_seleccionat = sistema.where(:edifici_id => @edifici.id).last
    llistat_elements = Array.new
    sistema_seleccionat.attributes.each_pair do |name, value|
      if (value == true)
        element = ElementPredefinit.where(:nom_element => name).last
        llistat_elements << {
          "descripcio"=>"#{element.descripcio_ca}"
        }
      end
    end
    llistat_elements.to_json
    return llistat_elements
  end



  # Arxiu de documents

  def items_arxiu
    checklist = ChecklistNouPlurifamiliar.where(:edifici_id => @edifici.id).last
    llistat_apartats = Array.new
    llistat_apartats << {
      "llicencies_preceptives"=>checklist.llicencies_preceptives,
      "certificat_final_obra"=>checklist.certificat_final_obra,
      "acta_recepcio_obra"=>checklist.acta_recepcio_obra,
      "escriptura_publica"=>checklist.escriptura_publica,
      "documents_garantia"=>checklist.documents_garantia,
      "documents_garantia_parts_comunes"=>checklist.documents_garantia_parts_comunes,
      "certificacio_energetica"=>checklist.certificacio_energetica,
      "polissa_assegurances"=>checklist.polissa_assegurances,
      "escriptura_propietat_horitzontal"=>checklist.escriptura_propietat_horitzontal,
      "estatus_comunitat"=>checklist.estatus_comunitat,
      "cedules_regims_juridics"=>checklist.cedules_regims_juridics,
      "carregues_reals"=>checklist.carregues_reals,
      "documents_complementaris"=>checklist.documents_complementaris,
      "documents_acreditatius_ajuts"=>checklist.documents_acreditatius_ajuts,
      "documents_justificacio_operacions"=>checklist.documents_justificacio_operacions,
      "certificat_final_obra_instalacions"=>checklist.certificat_final_obra_instalacions,
      "declaracions_ce_ascensors"=>checklist.declaracions_ce_ascensors
    }
    llistat_apartats.to_json
    return llistat_apartats
  end

  def items_arxiu_existents
    checklist = ChecklistExistentPlurifamiliar.where(:edifici_id => @edifici.id).last
    llistat_apartats = Array.new
    llistat_apartats << {
      "iite" => checklist.iite,
      "document_lliurament_iite" => checklist.document_lliurament_iite,
      "comunicat_ens_local" => checklist.comunicat_ens_local,
      "programa_rehabilitacio" => checklist.programa_rehabilitacio,
      "certificat_final_obra" => checklist.certificat_final_obra,
      "certificat_aptitud" => checklist.certificat_aptitud,
      "certificacio_energetica" => checklist.certificacio_energetica,
      "instruccions_us" => checklist.instruccions_us,
      "documents_justificatius_operacions" => checklist.documents_justificatius_operacions,
      "pressupostos_obres" => checklist.pressupostos_obres,
      "certificats_instalacions_comunes" => checklist.certificats_instalacions_comunes,
      "certificats_inspeccions_tecniques" => checklist.certificats_inspeccions_tecniques
    }
    llistat_apartats.to_json
    return llistat_apartats
  end

  def edifici_nou(tipus_edifici)
    # RESTFul service URL
    $DWS_RENDER_URL = "https://dws2.docmosis.com/services/rs/render"
    # Your account key
    $ACCESS_KEY = ENV['DOCMOSIS_ACCESS_KEY']

    # The template to use
    if tipus_edifici == 'unifamiliar'
      $TEMPLATE = "llibreedifici/nou_unifamiliar.docx" 
    else
      $TEMPLATE = "llibreedifici/nou.docx"
    end

    # The output file name
    $OUTPUT='LlibreEdifici.docx';

    # Aquí les dades de l'edifici per generar el document
    # Adreça de l'edifici
    if @edifici.identificacio.bloc_edifici.blank?
    	adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s
    else
    	adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ', bloc ' + @edifici.identificacio.bloc_edifici.to_s
    end
    codi_postal = @edifici.identificacio.cp_edifici
    poblacio = @edifici.identificacio.poblacio_edifici
    provincia = @edifici.identificacio.provincia_edifici
    referencia_cadastral = @edifici.identificacio.ref_cadastral
    any_inici_construccio = @edifici.identificacio.any_inici_construccio
    any_fi_construccio = @edifici.identificacio.any_fi_construccio

    # Imatges
    imatge_facana = @edifici.identificacio.foto_facana.url(:original)
    dimensions_facana = Paperclip::Geometry.from_file(imatge_facana)

    imatge_emplacament = @edifici.identificacio.planol_emplacament.url(:original)
    dimensions_emplacament = Paperclip::Geometry.from_file(imatge_emplacament)

    

    # Set the web proxy to use from the environment variable.
    # The settings for proxy are site-dependent so you may need to
    # adjust this
    RestClient.proxy = ENV['http_proxy'];

    RestClient.post($DWS_RENDER_URL,
    {
      'accessKey' => $ACCESS_KEY,
      'templateName' => $TEMPLATE,
      'outputName' => $OUTPUT,
      'data' => {
        'adreca' => adreca,
        'codi_postal' => codi_postal,
        'poblacio' => poblacio,
        'provincia' => provincia,
        'adreca_edifici' => adreca,
        'codi_postal_edifici' => codi_postal,
        'poblacio_edifici' => poblacio,
        'provincia_edifici' => provincia,
        'referencia_cadastral' => referencia_cadastral,
        'any_inici_construccio' => any_inici_construccio,
        'any_fi_construccio' => any_fi_construccio,
        'foto_facana' => "<img src='#{imatge_facana}' style='width:#{dimensions_facana.width}; height:#{dimensions_facana.height}'/>",
        'planol_emplacament' => "<img src='#{imatge_emplacament}' style='width:#{dimensions_emplacament.width}; height:#{dimensions_emplacament.height}'/>",
        'llistat_promotors' => items_promotor,
        'llistat_projectistes' => items_projectista,
        'llistat_colaboradors' => items_colaborador,
        'llistat_constructors' => items_constructor,
        'llistat_directors' => items_director,
        'llistat_directors_execucio' => items_director_execucio,
        'llistat_coordinadors' => items_coordinador,
        'llistat_laboratoris' => items_laboratori,
        'llistat_entitat_controls' => items_entitat_control,
        'llistat_subministradors' => items_subministrador,
        'llistat_subcontractistes' => items_subcontractista,
        'llicencies' => items_llicencies,
        'declaracions' => items_declaracions,
        'regim_propietats' => items_regim_propietats,
        'regim_especials' => items_regim_especials,
        'carregues' => items_carregues,
        'entitats' => items_entitats,
        'garantia_promotors' => items_garantia_promotors,
        'garantia_constructors' => items_garantia_constructors,
        'garantia_instalacions' => items_garantia_instalacions,
        'energia_certificats' => items_energia_certificats,
        'sistema_fonamentacio' => comprovacio_sistema('fonamentacio'),
        'elements_fonamentacio' => descripcio_constructiva(Fonamentacio),
        'llistat_fonamentacio' => items_sistemes('fonamentacio'),
        'sistema_estructura' => comprovacio_sistema('estructura'),
        'elements_estructura' => descripcio_constructiva(Estructura),
        'llistat_estructura' => items_sistemes('estructura'),
        'sistema_tancaments' => comprovacio_sistema('tancaments'),
        'elements_tancaments' => descripcio_constructiva(TancamentsVertical),
        'llistat_tancaments' => items_sistemes('tancaments'),
        'sistema_coberta' => comprovacio_sistema('cobertes'),
        'elements_coberta' => descripcio_constructiva(Coberta),
        'llistat_coberta' => items_sistemes('cobertes'),
        'comprovacio_coberta_plana' => comprovacio_coberta_plana,
        'comprovacio_coberta_inclinada' => comprovacio_coberta_inclinada,
        'comprovacio_lluernes' => comprovacio_lluernes,
        'sistema_particions' => comprovacio_sistema('particions'),
        'elements_particions' => descripcio_constructiva(Particio),
        'llistat_particions' => items_sistemes('particions'),
        'sistema_sanejament' => comprovacio_sistema('sanejament'),
        'elements_sanejament' => descripcio_constructiva(Sanejament),
        'llistat_sanejament' => items_sistemes('sanejament'),
        'sistema_aigua' => comprovacio_sistema('aigua'),
        'elements_aigua' => descripcio_constructiva(Aigua),
        'llistat_aigua' => items_sistemes('aigua'),
        'sistema_electricitat' => comprovacio_sistema('electricitat'),
        'elements_electricitat' => descripcio_constructiva(Electricitat),
        'llistat_electricitat' => items_sistemes('electricitat'),
        'sistema_climatitzacio' => comprovacio_sistema('climatitzacio'),
        'elements_climatitzacio' => descripcio_constructiva(Climatitzacio),
        'llistat_climatitzacio' => items_sistemes('climatitzacio'),
        'sistema_gas' => comprovacio_sistema('gas'),
        'elements_gas' => descripcio_constructiva(Ga),
        'llistat_gas' => items_sistemes('gas'),
        'sistema_ventilacio' => comprovacio_sistema('ventilacio'),
        'elements_ventilacio' => descripcio_constructiva(Ventilacio),
        'llistat_ventilacio' => items_sistemes('ventilacio'),
        'sistema_incendis' => comprovacio_sistema('incendis'),
        'elements_incendis' => descripcio_constructiva(Incendi),
        'llistat_incendis' => items_sistemes('incendis'),
        'sistema_ascensors' => comprovacio_sistema('ascensors'),
        'elements_ascensors' => descripcio_constructiva(Ascensor),
        'llistat_ascensors' => items_sistemes('ascensors'),
        'sistema_telecomunicacions' => comprovacio_sistema('telecomunicacions'),
        'elements_telecomunicacions' => descripcio_constructiva(Telecomunicacio),
        'llistat_telecomunicacions' => items_sistemes('telecomunicacions'),
        'sistema_especials' => comprovacio_sistema('especials'),
        'elements_especials' => descripcio_constructiva(Especial),
        'llistat_especials' => items_sistemes('especials'),
        'arxiu_documents' => items_arxiu
      }
    }.to_json, :content_type => :json) {|response, request, result, &block|
      case response.code
      when 200
        File.open($OUTPUT,"wb"){|f|f.syswrite(response.body)}
        #puts "\"#{$OUTPUT}\" created"
        send_file $OUTPUT, filename: "#{@edifici.nom_edifici}.docx", disposition: 'attachment'
      else
        # 4XX errors - client errors - something needs to be corrected in the request
        # 5XX errors - server side errors - possibly worth a retry

        # show error response (details)
        puts "Error response:\n\n#{response.code} #{response}\n\n"
        response.return!(request, result, &block)
      end
    }
 
	end

  def manual_edifici_nou
    # RESTFul service URL
    $DWS_RENDER_URL = "https://dws2.docmosis.com/services/rs/render"
    # Your account key
    $ACCESS_KEY = ENV['DOCMOSIS_ACCESS_KEY']

    # The template to use
    # NOTE that it has to be defined in your account with the same name specified here
    $TEMPLATE = "llibreedifici/manual.docx" # Change with your actual template name

    # The output file name
    $OUTPUT='ManualLlibreEdifici.docx';

    # Aquí les dades de l'edifici per generar el document
    # Adreça de l'edifici
    if @edifici.identificacio.bloc_edifici.blank?
      adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s
    else
      adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ', bloc ' + @edifici.identificacio.bloc_edifici.to_s
    end
    codi_postal = @edifici.identificacio.cp_edifici
    poblacio = @edifici.identificacio.poblacio_edifici
    provincia = @edifici.identificacio.provincia_edifici

    # Set the web proxy to use from the environment variable.
    # The settings for proxy are site-dependent so you may need to
    # adjust this
    RestClient.proxy = ENV['http_proxy'];

    RestClient.post($DWS_RENDER_URL,
    {
      'accessKey' => $ACCESS_KEY,
      'templateName' => $TEMPLATE,
      'outputName' => $OUTPUT,
      'data' => {
        'adreca' => adreca,
        'codi_postal' => codi_postal,
        'poblacio' => poblacio,
        'provincia' => provincia,
        'sistema_estructura' => comprovacio_sistema_manual('estructura'),
        'elements_estructura' => descripcio_constructiva(Estructura),
        'llistat_estructura' => items_sistemes_manual('estructura'),
        'sistema_tancaments' => comprovacio_sistema_manual('tancaments'),
        'elements_tancaments' => descripcio_constructiva(TancamentsVertical),
        'llistat_tancaments' => items_sistemes_manual('tancaments'),
        'sistema_coberta' => comprovacio_sistema_manual('cobertes'),
        'elements_coberta' => descripcio_constructiva(Coberta),
        'llistat_coberta' => items_sistemes_manual('cobertes'),
        'comprovacio_coberta_plana' => comprovacio_coberta_plana,
        'comprovacio_coberta_inclinada' => comprovacio_coberta_inclinada,
        'comprovacio_lluernes' => comprovacio_lluernes,
        'sistema_particions' => comprovacio_sistema_manual('particions'),
        'elements_particions' => descripcio_constructiva(Particio),
        'llistat_particions' => items_sistemes_manual('particions'),
        'sistema_sanejament' => comprovacio_sistema_manual('sanejament'),
        'elements_sanejament' => descripcio_constructiva(Sanejament),
        'llistat_sanejament' => items_sistemes_manual('sanejament'),
        'sistema_aigua' => comprovacio_sistema_manual('aigua'),
        'elements_aigua' => descripcio_constructiva(Aigua),
        'llistat_aigua' => items_sistemes_manual('aigua'),
        'sistema_electricitat' => comprovacio_sistema_manual('electricitat'),
        'elements_electricitat' => descripcio_constructiva(Electricitat),
        'llistat_electricitat' => items_sistemes_manual('electricitat'),
        'sistema_climatitzacio' => comprovacio_sistema_manual('climatitzacio'),
        'elements_climatitzacio' => descripcio_constructiva(Climatitzacio),
        'llistat_climatitzacio' => items_sistemes_manual('climatitzacio'),
        'sistema_gas' => comprovacio_sistema_manual('gas'),
        'elements_gas' => descripcio_constructiva(Ga),
        'llistat_gas' => items_sistemes_manual('gas'),
        'sistema_ventilacio' => comprovacio_sistema_manual('ventilacio'),
        'elements_ventilacio' => descripcio_constructiva(Ventilacio),
        'llistat_ventilacio' => items_sistemes_manual('ventilacio'),
        'sistema_incendis' => comprovacio_sistema_manual('incendis'),
        'elements_incendis' => descripcio_constructiva(Incendi),
        'llistat_incendis' => items_sistemes_manual('incendis'),
        'sistema_telecomunicacions' => comprovacio_sistema_manual('telecomunicacions'),
        'elements_telecomunicacions' => descripcio_constructiva(Telecomunicacio),
        'llistat_telecomunicacions' => items_sistemes_manual('telecomunicacions')
      }
    }.to_json, :content_type => :json) {|response, request, result, &block|
      case response.code
      when 200
        File.open($OUTPUT,"wb"){|f|f.syswrite(response.body)}
        #puts "\"#{$OUTPUT}\" created"
        send_file $OUTPUT, filename: "#{@edifici.nom_edifici}_manual.docx", disposition: 'attachment'
      else
        # 4XX errors - client errors - something needs to be corrected in the request
        # 5XX errors - server side errors - possibly worth a retry

        # show error response (details)
        puts "Error response:\n\n#{response.code} #{response}\n\n"
        response.return!(request, result, &block)
      end
    }
 
  end

  def edifici_existent
    # RESTFul service URL
    $DWS_RENDER_URL = "https://dws2.docmosis.com/services/rs/render"
    # Your account key
    $ACCESS_KEY = ENV['DOCMOSIS_ACCESS_KEY']

    # The template to use
    $TEMPLATE = "llibreedifici/existent.docx"

    # The output file name
    $OUTPUT='LlibreEdificiExistent.docx';

    # Aquí les dades de l'edifici per generar el document
    # Adreça de l'edifici
    if @edifici.identificacio.bloc_edifici.blank?
      adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s
    else
      adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ', bloc ' + @edifici.identificacio.bloc_edifici.to_s
    end
    codi_postal = @edifici.identificacio.cp_edifici
    poblacio = @edifici.identificacio.poblacio_edifici
    provincia = @edifici.identificacio.provincia_edifici
    referencia_cadastral = @edifici.identificacio.ref_cadastral
    origen_any_construccio = @edifici.identificacio.origen_any_construccio
    any_fi_construccio = @edifici.identificacio.any_fi_construccio

    # Imatges
    imatge_facana = @edifici.identificacio.foto_facana.url(:original)
    dimensions_facana = Paperclip::Geometry.from_file(imatge_facana)

    imatge_emplacament = @edifici.identificacio.planol_emplacament.url(:original)
    dimensions_emplacament = Paperclip::Geometry.from_file(imatge_emplacament)

    

    # Set the web proxy to use from the environment variable.
    # The settings for proxy are site-dependent so you may need to
    # adjust this
    RestClient.proxy = ENV['http_proxy'];

    RestClient.post($DWS_RENDER_URL,
    {
      'accessKey' => $ACCESS_KEY,
      'templateName' => $TEMPLATE,
      'outputName' => $OUTPUT,
      'data' => {
        'adreca' => adreca,
        'codi_postal' => codi_postal,
        'poblacio' => poblacio,
        'provincia' => provincia,
        'adreca_edifici' => adreca,
        'codi_postal_edifici' => codi_postal,
        'poblacio_edifici' => poblacio,
        'provincia_edifici' => provincia,
        'referencia_cadastral' => referencia_cadastral,
        'origen_any_construccio' => origen_any_construccio,
        'any_fi_construccio' => any_fi_construccio,
        'foto_facana' => "<img src='#{imatge_facana}' style='width:#{dimensions_facana.width}; height:#{dimensions_facana.height}'/>",
        'planol_emplacament' => "<img src='#{imatge_emplacament}' style='width:#{dimensions_emplacament.width}; height:#{dimensions_emplacament.height}'/>",
        'llistat_promotors' => items_promotor,
        'llistat_projectistes' => items_projectista,
        'llistat_colaboradors' => items_colaborador,
        'llistat_constructors' => items_constructor,
        'llistat_directors' => items_director,
        'llistat_directors_execucio' => items_director_execucio,
        'llistat_coordinadors' => items_coordinador,
        'llistat_laboratoris' => items_laboratori,
        'llistat_entitat_controls' => items_entitat_control,
        'llistat_subministradors' => items_subministrador,
        'llistat_subcontractistes' => items_subcontractista,
        'llicencies' => items_llicencies,
        'declaracions' => items_declaracions,
        'regim_propietats' => items_regim_propietats,
        'regim_especials' => items_regim_especials,
        'carregues' => items_carregues,
        'entitats' => items_entitats,
        'garantia_promotors' => items_garantia_promotors,
        'garantia_constructors' => items_garantia_constructors,
        'garantia_instalacions' => items_garantia_instalacions,
        'energia_certificats' => items_energia_certificats,
        'sistema_fonamentacio' => comprovacio_sistema('fonamentacio'),
        'elements_fonamentacio' => descripcio_constructiva(Fonamentacio),
        'llistat_fonamentacio' => items_sistemes('fonamentacio'),
        'sistema_estructura' => comprovacio_sistema('estructura'),
        'elements_estructura' => descripcio_constructiva(Estructura),
        'llistat_estructura' => items_sistemes('estructura'),
        'sistema_tancaments' => comprovacio_sistema('tancaments'),
        'elements_tancaments' => descripcio_constructiva(TancamentsVertical),
        'llistat_tancaments' => items_sistemes('tancaments'),
        'sistema_coberta' => comprovacio_sistema('cobertes'),
        'elements_coberta' => descripcio_constructiva(Coberta),
        'llistat_coberta' => items_sistemes('cobertes'),
        'comprovacio_coberta_plana' => comprovacio_coberta_plana,
        'comprovacio_coberta_inclinada' => comprovacio_coberta_inclinada,
        'comprovacio_lluernes' => comprovacio_lluernes,
        'sistema_particions' => comprovacio_sistema('particions'),
        'elements_particions' => descripcio_constructiva(Particio),
        'llistat_particions' => items_sistemes('particions'),
        'sistema_sanejament' => comprovacio_sistema('sanejament'),
        'elements_sanejament' => descripcio_constructiva(Sanejament),
        'llistat_sanejament' => items_sistemes('sanejament'),
        'sistema_aigua' => comprovacio_sistema('aigua'),
        'elements_aigua' => descripcio_constructiva(Aigua),
        'llistat_aigua' => items_sistemes('aigua'),
        'sistema_electricitat' => comprovacio_sistema('electricitat'),
        'elements_electricitat' => descripcio_constructiva(Electricitat),
        'llistat_electricitat' => items_sistemes('electricitat'),
        'sistema_climatitzacio' => comprovacio_sistema('climatitzacio'),
        'elements_climatitzacio' => descripcio_constructiva(Climatitzacio),
        'llistat_climatitzacio' => items_sistemes('climatitzacio'),
        'sistema_gas' => comprovacio_sistema('gas'),
        'elements_gas' => descripcio_constructiva(Ga),
        'llistat_gas' => items_sistemes('gas'),
        'sistema_ventilacio' => comprovacio_sistema('ventilacio'),
        'elements_ventilacio' => descripcio_constructiva(Ventilacio),
        'llistat_ventilacio' => items_sistemes('ventilacio'),
        'sistema_incendis' => comprovacio_sistema('incendis'),
        'elements_incendis' => descripcio_constructiva(Incendi),
        'llistat_incendis' => items_sistemes('incendis'),
        'sistema_ascensors' => comprovacio_sistema('ascensors'),
        'elements_ascensors' => descripcio_constructiva(Ascensor),
        'llistat_ascensors' => items_sistemes('ascensors'),
        'sistema_telecomunicacions' => comprovacio_sistema('telecomunicacions'),
        'elements_telecomunicacions' => descripcio_constructiva(Telecomunicacio),
        'llistat_telecomunicacions' => items_sistemes('telecomunicacions'),
        'sistema_especials' => comprovacio_sistema('especials'),
        'elements_especials' => descripcio_constructiva(Especial),
        'llistat_especials' => items_sistemes('especials'),
        'arxiu_documents' => items_arxiu_existents
      }
    }.to_json, :content_type => :json) {|response, request, result, &block|
      case response.code
      when 200
        File.open($OUTPUT,"wb"){|f|f.syswrite(response.body)}
        #puts "\"#{$OUTPUT}\" created"
        send_file $OUTPUT, filename: "#{@edifici.nom_edifici}.docx", disposition: 'attachment'
      else
        # 4XX errors - client errors - something needs to be corrected in the request
        # 5XX errors - server side errors - possibly worth a retry

        # show error response (details)
        puts "Error response:\n\n#{response.code} #{response}\n\n"
        response.return!(request, result, &block)
      end
    }
 
  end


end