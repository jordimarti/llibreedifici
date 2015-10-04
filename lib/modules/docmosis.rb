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



  def edifici_nou
    # RESTFul service URL
    $DWS_RENDER_URL = "https://dws2.docmosis.com/services/rs/render"
    # Your account key
    $ACCESS_KEY = ENV['DOCMOSIS_ACCESS_KEY']

    # The template to use
    # NOTE that it has to be defined in your account with the same name specified here
    $TEMPLATE = "llibreedifici/nou.docx" # Change with your actual template name

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
        'sistema_fonamentacio' => comprovacio_sistema('fonamentacio'),
        'llistat_fonamentacio' => items_sistemes('fonamentacio'),
        'sistema_estructura' => comprovacio_sistema('estructura'),
        'llistat_estructura' => items_sistemes('estructura'),
        'sistema_tancaments' => comprovacio_sistema('tancaments'),
        'llistat_tancaments' => items_sistemes('tancaments'),
        'sistema_coberta' => comprovacio_sistema('cobertes'),
        'llistat_coberta' => items_sistemes('cobertes')
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