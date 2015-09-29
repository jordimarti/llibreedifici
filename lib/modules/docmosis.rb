module Docmosis
	def edifici_nou
		imatge_facana = @edifici.identificacio.foto_facana.url(:medium)
    dimensions_facana = Paperclip::Geometry.from_file(imatge_facana)

    imatge_emplacament = @edifici.identificacio.planol_emplacament.url(:medium)
    dimensions_emplacament = Paperclip::Geometry.from_file(imatge_emplacament)

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
        'llistat_promotors' => items_promotor
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