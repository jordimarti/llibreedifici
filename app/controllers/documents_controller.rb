class DocumentsController < ApplicationController
  before_action :set_edifici
  include Docmosis
  layout 'edifici'

  def index
    @submenu_actiu = 'documents'
  end

  def docmosis_edifici_nou_plurifamiliar
    # Mètode dins del mòdul Docmosis
    edifici_nou('plurifamiliar')
  end

  def docmosis_edifici_nou_unifamiliar
    edifici_nou('unifamiliar')
  end

  def docmosis_manual_edifici_nou
    # Mètode dins del mòdul Docmosis
    manual_edifici_nou
  end

  def docmosis_edifici_existent
    edifici_existent
  end

  def docmosis_old
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
    $TEMPLATE = "llibreedifici/Prova2Docmosis.docx" # Change with your actual template name

    # The output file name
    $OUTPUT='LlibreEdifici.docx';

    def msg (message)
        {'msg'=>"#{message}"}
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
                    'date' => Date.today,
                    'title' => 'Welcome to Jordi Cloud',
                    "imatge_html" => "<h1>Hola Jordi</h1><p>Aquí estem posant imatges per html</p><img src='#{imatge_facana}' style='width:#{dimensions_facana.width}; height:#{dimensions_facana.height}'/>",
                    'messages' => [
                                    msg('This cloud experience is better than I thought.'),
                                    msg('The sun is shining'),
                                    msg('Right, now back to work.')
                                  ]
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

  def nou
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/nou.docx", "#{Rails.root}/tmp")
        # Adreça de l'edifici
        adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ' ' + @edifici.identificacio.bloc_edifici.to_s
        doc.replace("$adreca$", adreca)
        doc.replace("$adreca_edifici$", adreca)
        doc.replace("$codi_postal$", @edifici.identificacio.cp_edifici)
        doc.replace("$codi_postal_edifici$", @edifici.identificacio.cp_edifici)
        doc.replace("$poblacio$", @edifici.identificacio.poblacio_edifici)
        doc.replace("$poblacio_edifici$", @edifici.identificacio.poblacio_edifici)
        doc.replace("$provincia$", @edifici.identificacio.provincia_edifici)
        doc.replace("$provincia_edifici$", @edifici.identificacio.provincia_edifici)
        doc.replace("$referencia_cadastral$", @edifici.identificacio.ref_cadastral)
        doc.replace("$any_inici_construccio$", @edifici.identificacio.any_inici_construccio)
        doc.replace("$any_fi_construccio$", @edifici.identificacio.any_fi_construccio)
        
        # Promotor
        word_promotor = ''
        if @edifici.promotors.count > 0
          @edifici.promotors.each do |promotor|
            word_promotor = word_promotor + '<w:p w14:paraId="4A63F336" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00EC1F1B"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r w:rsidRPr="00EC1F1B"><w:rPr><w:b/></w:rPr><w:t>Promotor</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.nom_promotor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF/CIF:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.nif_promotor + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="61432898" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="8638" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="5ACA8A64" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Adreça:</w:t></w:r></w:p><w:p w14:paraId="272C158A" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.adreca_promotor + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Codi postal:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.cp_promotor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Població:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.poblacio_promotor + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="0FF076AE" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0AA197CB" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Província:</w:t></w:r></w:p><w:p w14:paraId="74490037" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.provincia_promotor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="2F9A2409" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>País:</w:t></w:r></w:p><w:p w14:paraId="47653008" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + promotor.pais_promotor + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"/><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$promotor$", word_promotor)
        
        # Projectista
        word_projectista = ''
        if @edifici.projectistes.count > 0
          @edifici.projectistes.each do |projectista|
            word_projectista = word_projectista + '<w:p w14:paraId="4A63F336" w14:textId="69799D5E" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00B4194E"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Projectista</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="23E30075" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + projectista.nom_projectista + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="325A66C5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="36199EA2" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + projectista.nif_projectista + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="38673767" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Titulació</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="2C0C52D5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + projectista.titulacio_projectista + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="29EE1FC5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Raó social:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="1B1B7C7C" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + projectista.rao_social_projectista + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$projectista$", word_projectista)
        
        # Constructor
        word_constructor = ''
        if @edifici.constructors.count > 0
          @edifici.constructors.each do |constructor|
            word_constructor = word_constructor + '<w:p w14:paraId="4A63F336" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00EC1F1B"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r w:rsidRPr="00EC1F1B"><w:rPr><w:b/></w:rPr><w:t>Constructor</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.nom_constructor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF/CIF:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.nif_constructor + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="61432898" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="8638" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="5ACA8A64" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Adreça:</w:t></w:r></w:p><w:p w14:paraId="272C158A" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.adreca_constructor + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Codi postal:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.cp_constructor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Població:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.poblacio_constructor + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="0FF076AE" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0AA197CB" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Província:</w:t></w:r></w:p><w:p w14:paraId="74490037" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.provincia_constructor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="2F9A2409" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>País:</w:t></w:r></w:p><w:p w14:paraId="47653008" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + constructor.pais_constructor + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"/><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$constructor$", word_constructor)

        # Director d'obra
        word_director = ''
        if @edifici.directors.count > 0
          @edifici.directors.each do |director|
            word_director = word_director + '<w:p w14:paraId="4A63F336" w14:textId="69799D5E" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00B4194E"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Director d\'obra</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="23E30075" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director.nom_director + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="325A66C5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="36199EA2" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director.nif_director + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="38673767" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Titulació</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="2C0C52D5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director.titulacio_director + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="29EE1FC5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Raó social:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="1B1B7C7C" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director.rao_social_director + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$director_obra$", word_director)

        # Director d'execució d'obra
        word_director_execucio = ''
        if @edifici.execucio_directors.count > 0
          @edifici.execucio_directors.each do |director_execucio|
            word_director_execucio = word_director_execucio + '<w:p w14:paraId="4A63F336" w14:textId="69799D5E" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00B4194E"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Director d\'execució d\'obra</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="23E30075" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director_execucio.nom_director_execucio + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="325A66C5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="36199EA2" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director_execucio.nif_director_execucio + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="38673767" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Titulació</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="2C0C52D5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director_execucio.titulacio_director_execucio + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="29EE1FC5" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Raó social:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="1B1B7C7C" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + director_execucio.rao_social_director_execucio + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$director_execucio$", word_director_execucio)

        # Laboratoris
        word_laboratoris = ''
        if @edifici.laboratoris.count > 0
          @edifici.laboratoris.each do |laboratori|
            word_laboratoris = word_laboratoris + '<w:p w14:paraId="4A63F336" w14:textId="69799D5E" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E" w:rsidRPr="00477B92"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Laboratori</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:type="auto" w:w="0"/><w:tblBorders><w:top w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:left w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:right w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideV w:color="auto" w:space="0" w:sz="0" w:val="none"/></w:tblBorders><w:tblLook w:firstColumn="1" w:firstRow="1" w:lastColumn="0" w:lastRow="0" w:noHBand="0" w:noVBand="1" w:val="04A0"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w14:paraId="75F533A0" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidP="00477B92" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="23E30075" w:rsidP="00477B92" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + laboratori.nom_laboratori + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="325A66C5" w:rsidP="00477B92" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF</w:t></w:r><w:r w:rsidR="00EC1F1B"><w:t>:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="36199EA2" w:rsidP="00477B92" w:rsidR="00EC1F1B" w:rsidRDefault="00B4194E"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + laboratori.nif_laboratori + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:h="16840" w:w="11900"/><w:pgMar w:bottom="1417" w:footer="708" w:gutter="0" w:header="708" w:left="1701" w:right="1701" w:top="1417"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$laboratori$", word_laboratoris)

        # Entitats de control
        word_entitats = ''
        if @edifici.entitat_controls.count > 0
          @edifici.entitat_controls.each do |entitat|
            word_entitats = word_entitats + '<w:p w14:paraId="4A63F336" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00EC1F1B"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r w:rsidRPr="00EC1F1B"><w:rPr><w:b/></w:rPr><w:t>Entitat de control</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.nom_entitat_control + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF/CIF:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.nif_entitat_control + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="61432898" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="8638" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="5ACA8A64" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Adreça:</w:t></w:r></w:p><w:p w14:paraId="272C158A" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.adreca_entitat_control + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Codi postal:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.cp_entitat_control + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Població:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.poblacio_entitat_control + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="0FF076AE" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0AA197CB" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Província:</w:t></w:r></w:p><w:p w14:paraId="74490037" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.provincia_entitat_control + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="2F9A2409" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>País:</w:t></w:r></w:p><w:p w14:paraId="47653008" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + entitat.pais_entitat_control + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"/><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$entitat_control$", word_entitats)

        # Subministradors de productes
        word_subministrador = ''
        if @edifici.subministradors.count > 0
          @edifici.subministradors.each do |subministrador|
            word_subministrador = word_subministrador + '<w:p w14:paraId="4A63F336" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00EC1F1B"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r w:rsidRPr="00EC1F1B"><w:rPr><w:b/></w:rPr><w:t>Subministrador de productes</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.nom_subministrador + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF/CIF:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.nif_subministrador + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="61432898" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="8638" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="5ACA8A64" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Adreça:</w:t></w:r></w:p><w:p w14:paraId="272C158A" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.adreca_subministrador + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Codi postal:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.cp_subministrador + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Població:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.poblacio_subministrador + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="0FF076AE" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0AA197CB" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Província:</w:t></w:r></w:p><w:p w14:paraId="74490037" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.provincia_subministrador + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="2F9A2409" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>País:</w:t></w:r></w:p><w:p w14:paraId="47653008" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + subministrador.pais_subministrador + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"/><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$subministrador$", word_subministrador)

        # Industrials
        word_industrial = ''
        if @edifici.industrials.count > 0
          @edifici.industrials.each do |industrial|
            word_industrial = word_industrial + '<w:p w14:paraId="4A63F336" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRPr="00477B92" w:rsidRDefault="00EC1F1B"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r w:rsidRPr="00EC1F1B"><w:rPr><w:b/></w:rPr><w:t>Industrial</w:t></w:r></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w:rsidR="00EC1F1B" w14:paraId="75F533A0" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="77762A24" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="0B3BAAE1" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.nom_industrial + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0B1740B3" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>NIF/CIF:</w:t></w:r></w:p><w:p w14:paraId="1619C708" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.nif_industrial + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="61432898" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="8638" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="5ACA8A64" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Adreça:</w:t></w:r></w:p><w:p w14:paraId="272C158A" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.adreca_industrial + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="62DE70FD" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="68794AC6" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Codi postal:</w:t></w:r></w:p><w:p w14:paraId="10367BED" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.cp_industrial + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="153CFF74" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Població:</w:t></w:r></w:p><w:p w14:paraId="6020BC23" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.poblacio_industrial + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="00EC1F1B" w14:paraId="0FF076AE" w14:textId="77777777" w:rsidTr="00477B92"><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="0AA197CB" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>Província:</w:t></w:r></w:p><w:p w14:paraId="74490037" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.provincia_industrial + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4319" w:type="dxa"/></w:tcPr><w:p w14:paraId="2F9A2409" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="titoltaula"/></w:pPr><w:r><w:t>País:</w:t></w:r></w:p><w:p w14:paraId="47653008" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B" w:rsidP="00477B92"><w:pPr><w:pStyle w:val="normaltaula"/></w:pPr><w:r><w:t>' + industrial.pais_industrial + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="1705A789" w14:textId="77777777" w:rsidR="00EC1F1B" w:rsidRDefault="00EC1F1B"/><w:sectPr w:rsidR="00EC1F1B" w:rsidSect="00B66F90"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1417" w:right="1701" w:bottom="1417" w:left="1701" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
          end
        end
        doc.replace("$industrial$", word_industrial)

        # Descripció constructiva
        def llista(element_llista)
          return '<w:p w:rsidP="006E3F51" w:rsidR="00676FB5" w:rsidRDefault="006E3F51"><w:pPr><w:pStyle w:val="Prrafodelista"/><w:numPr><w:ilvl w:val="0"/><w:numId w:val="1"/></w:numPr></w:pPr><w:r><w:t>' + element_llista + '</w:t></w:r></w:p>'
        end
        # Mètode per comprovar si hi ha elements definits per l'usuari
        def elements_extres(sistema)
          nous_elements = Element.where(:edifici_id => @edifici.id, :sistema_element => sistema)
          llistat_nous_elements = ''
          nous_elements.each do |e| 
            llistat_nous_elements = llistat_nous_elements + llista(e.nom_element)
          end
          if nous_elements.count > 0
            return llistat_nous_elements
          else
            return ''
          end
        end
        # Fonamentació
        elements_fonamentacio = ''
        existeix_fonamentacio = false
        if @edifici.fonamentacio.mur_pedra == true
          elements_fonamentacio = elements_fonamentacio + llista('Mur de contenció de pedra')
          existeix_fonamentacio = true
        end
        if @edifici.fonamentacio.mur_fabrica_mao == true
          elements_fonamentacio = elements_fonamentacio + llista('Mur de contenció de fàbrica de maó')
          existeix_fonamentacio = true
        end
        if @edifici.fonamentacio.mur_fabrica_bloc == true
          elements_fonamentacio = elements_fonamentacio + llista('Mur de contenció de fàbrica de bloc')
          existeix_fonamentacio = true
        end
        if @edifici.fonamentacio.mur_formigo_armat == true
          elements_fonamentacio = elements_fonamentacio + llista('Mur de contenció de formigó armat')
          existeix_fonamentacio = true
        end 
        if @edifici.fonamentacio.mur_pantalla == true
          elements_fonamentacio = elements_fonamentacio + llista('Mur pantalla')
          existeix_fonamentacio = true
        end 
        if @edifici.fonamentacio.sabates_paredat == true
          elements_fonamentacio = elements_fonamentacio + llista('Sabates de paredat')
          existeix_fonamentacio = true
        end 
        if @edifici.fonamentacio.sabates_formigo == true
          elements_fonamentacio = elements_fonamentacio + llista('Sabates o rases de formigó')
          existeix_fonamentacio = true
        end 
        if @edifici.fonamentacio.llosa == true
          elements_fonamentacio = elements_fonamentacio + llista('Llosa de formigó')
          existeix_fonamentacio = true
        end 
        if @edifici.fonamentacio.pilons == true
          elements_fonamentacio = elements_fonamentacio + llista('Fonamentació profunda de pilons')
          existeix_fonamentacio = true
        end 
        if @edifici.fonamentacio.pantalles == true
          elements_fonamentacio = elements_fonamentacio + llista('Fonamentació profunda de pantalles')
          existeix_fonamentacio = true
        end 
          
        if existeix_fonamentacio == true || elements_extres('fonamentacio') != ''
          word_fonamentacio = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Fonaments</w:t></w:r></w:p>' + elements_fonamentacio + elements_extres('fonamentacio')
        else
          word_fonamentacio = ''
        end
        doc.replace("$fonamentacio$", word_fonamentacio)


        # Estructura
        elements_estructura = ''
        existeix_estructura = false
        if @edifici.estructura.parets_pedra == true
          elements_estructura = elements_estructura + llista('Parets de paredat')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_formigo_armat == true
          elements_estructura = elements_estructura + llista('Parets de formigó armat')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_tova == true
          elements_estructura = elements_estructura + llista('Parets de tova')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_tapia == true
          elements_estructura = elements_estructura + llista('Parets de tàpia')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_fabrica_mao == true
          elements_estructura = elements_estructura + llista('Parets de fàbrica de maó')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_bloc_ceramic == true
          elements_estructura = elements_estructura + llista('Parets de bloc ceràmic')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_bloc_formigo == true
          elements_estructura = elements_estructura + llista('Parets de bloc de formigó')
          existeix_estructura = true
        end
        if @edifici.estructura.parets_entramat_fusta == true
          elements_estructura = elements_estructura + llista('Parets d\'entramat de fusta')
          existeix_estructura = true
        end
        if @edifici.estructura.pilars_mao == true
          elements_estructura = elements_estructura + llista('Pilars de maons')
          existeix_estructura = true
        end
        if @edifici.estructura.pilars_ferro_colat == true
          elements_estructura = elements_estructura + llista('Pilars de ferro colat')
          existeix_estructura = true
        end
        if @edifici.estructura.pilars_acer == true
          elements_estructura = elements_estructura + llista('Pilars d\'acer')
          existeix_estructura = true
        end
        if @edifici.estructura.pilars_formigo_armat == true
          elements_estructura = elements_estructura + llista('Pilars de formigó armat')
          existeix_estructura = true
        end
        if @edifici.estructura.jasseres_fusta == true
          elements_estructura = elements_estructura + llista('Jàsseres de fusta')
          existeix_estructura = true
        end
        if @edifici.estructura.jasseres_fusta_laminada == true
          elements_estructura = elements_estructura + llista('Jàsseres de fusta laminada')
          existeix_estructura = true
        end
        if @edifici.estructura.jasseres_acer == true
          elements_estructura = elements_estructura + llista('Jàsseres d\'acer')
          existeix_estructura = true
        end
        if @edifici.estructura.jasseres_formigo_armat == true
          elements_estructura = elements_estructura + llista('Jàsseres de formigó armat')
          existeix_estructura = true
        end
        if @edifici.estructura.jasseres_acer_formigo == true
          elements_estructura = elements_estructura + llista('Jàsseres mixtes d\'acer-formigó')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_fusta == true
          elements_estructura = elements_estructura + llista('Sostre de fusta')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_metalic == true
          elements_estructura = elements_estructura + llista('Sostre metàl·lic')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_formigo_armat == true
          elements_estructura = elements_estructura + llista('Sostre de formigó armat')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_ceramica_armada == true
          elements_estructura = elements_estructura + llista('Sostre de ceràmica armada')
          existeix_estructura = true
        end
        if @edifici.estructura.entrebigat_taulell == true
          elements_estructura = elements_estructura + llista('Entrebigat de taulell')
          existeix_estructura = true
        end
        if @edifici.estructura.entrebigat_revolto_ceramic == true
          elements_estructura = elements_estructura + llista('Entrebigat de revoltó ceràmic')
          existeix_estructura = true
        end
        if @edifici.estructura.entrebigat_revolto_formigo == true
          elements_estructura = elements_estructura + llista('Entrebigat de revoltó de formigó')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_reticular == true
          elements_estructura = elements_estructura + llista('Forjat reticular')
          existeix_estructura = true
        end
        if @edifici.estructura.llosa_formigo == true
          elements_estructura = elements_estructura + llista('Llosa de formigó')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_sanitari == true
          elements_estructura = elements_estructura + llista('Forjat sanitari')
          existeix_estructura = true
        end
        if @edifici.estructura.solera == true
          elements_estructura = elements_estructura + llista('Solera')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_horitzontal_coberta_capa_pendent == true
          elements_estructura = elements_estructura + llista('Estructura de coberta de sostre horitzontal amb capa de formació de pendents')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_horitzontal_coberta_envanets == true
          elements_estructura = elements_estructura + llista('Estructura de coberta de sostre horitzontal amb envanets i taulell')
          existeix_estructura = true
        end
        if @edifici.estructura.forjat_inclinat_coberta_formigo == true
          elements_estructura = elements_estructura + llista('Estructura de coberta de sostre inclinat de formigó armat')
          existeix_estructura = true
        end
        if @edifici.estructura.encavallada_bigues_formigo == true
          elements_estructura = elements_estructura + llista('Encavallada de bigues de formigó armat i taulell')
          existeix_estructura = true
        end
        if @edifici.estructura.encavallada_bigues_metall == true
          elements_estructura = elements_estructura + llista('Encavallada de bigues metàl·liques i taulell')
          existeix_estructura = true
        end
        if @edifici.estructura.encavallada_bigues_fusta == true
          elements_estructura = elements_estructura + llista('Encavallada de bigues de fusta i taulell')
          existeix_estructura = true
        end
        if @edifici.estructura.coberta_taulell_ceramic == true
          elements_estructura = elements_estructura + llista('Estructura de coberta de taulell ceràmic')
          existeix_estructura = true
        end
        if @edifici.estructura.coberta_taulell_fusta == true
          elements_estructura = elements_estructura + llista('Estructura de coberta de taulell de fusta')
          existeix_estructura = true
        end
        if @edifici.estructura.coberta_sandwich == true
          elements_estructura = elements_estructura + llista('Estructura de coberta de xapa o panells sandwich')
          existeix_estructura = true
        end
        if @edifici.estructura.escala_fusta == true
          elements_estructura = elements_estructura + llista('Escala de fusta')
          existeix_estructura = true
        end
        if @edifici.estructura.escala_acer == true
          elements_estructura = elements_estructura + llista('Escala d\'acer')
          existeix_estructura = true
        end
        if @edifici.estructura.escala_ceramica == true
          elements_estructura = elements_estructura + llista('Escala de volta ceràmica')
          existeix_estructura = true
        end
        if @edifici.estructura.escala_llosa_armada == true
          elements_estructura = elements_estructura + llista('Escala de llosa armada')
          existeix_estructura = true
        end
        if @edifici.estructura.escala_biguetes_formigo_armat == true
          elements_estructura = elements_estructura + llista('Escala de biguetes de formigó armat')
          existeix_estructura = true
        end
        if existeix_estructura == true || elements_extres('estructura') != ''
          word_estructura = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Estructura</w:t></w:r></w:p>' + elements_estructura + elements_extres('estructura')
        else
          word_estructura = ''
        end
        doc.replace("$estructura$", word_estructura)
          
        # Tancaments verticals
        # Fem servir igualment el mètode llista que es fa servir en els altres casos, però si hi ha cambra d'aire l'afegim utilitzant el mètode llista tancaments
        def llista_tancaments(element_llista)
          if @edifici.tancaments_vertical.cambra_aire_facana == true
            text_tancaments = element_llista + ' i cambra d\'aire'
            llista(text_tancaments)
          else
            llista(element_llista)
          end
        end
        elements_tancaments = ''
        existeix_tancaments = false
        if @edifici.tancaments_vertical.acabat_vist_paredat == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de paredat amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_vist_carreus == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de carreus amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_vist_fabrica_mao == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de fàbrica de maons amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_vist_fabrica_bloc_ceramic == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de bloc ceràmic amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_vist_bloc_formigo == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de bloc de formigó amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_vist_panell_formigo == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de panells de formigó amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_vist_panell_metalic_sandwich == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets de panells metàl·lics o de tipus sandwich amb acabat vist')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_arrebossat_pintat == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb acabat revestit arrebossat i pintat')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_estucat == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb acabat revestit estucat')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_morter_monocapa == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb revestiment de morter monocapa')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_aplacat_ceramic == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb revestiment d\'aplacat ceràmic')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_aplacat_pedra == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb revestiment d\'aplacat de pedra')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_xapa_metalica == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb revestiment de xapa metàl·lica')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.acabat_revestit_xapa_metalica == true
          elements_tancaments = elements_tancaments + llista_tancaments('Parets amb revestiment de xapa metàl·lica')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.fusteria_fusta == true
          elements_tancaments = elements_tancaments + llista('Fusteries de fusta')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.fusteria_acer == true
          elements_tancaments = elements_tancaments + llista('Fusteries d\'acer')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.fusteria_alumini == true
          elements_tancaments = elements_tancaments + llista('Fusteries d\'alumini')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.fusteria_pvc == true
          elements_tancaments = elements_tancaments + llista('Fusteries de PVC')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.vidre_simple == true
          elements_tancaments = elements_tancaments + llista('Fusteries amb vidre senzill')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.vidre_doble == true
          elements_tancaments = elements_tancaments + llista('Fusteries amb vidre doble')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.vidre_triple == true
          elements_tancaments = elements_tancaments + llista('Fusteries amb vidre triple')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.vidre_baix_emissiu == true
          elements_tancaments = elements_tancaments + llista('Vidre amb capa baix emissiva')
          existeix_tancaments = true
        end
        if @edifici.tancaments_vertical.vidre_control_solar == true
          elements_tancaments = elements_tancaments + llista('Vidre amb capa de control solar')
          existeix_tancaments = true
        end

        if existeix_tancaments == true || elements_extres('tancaments') != ''
          word_tancaments = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Tancaments verticals</w:t></w:r></w:p>' + elements_tancaments + elements_extres('tancaments')
        else
          word_tancaments = ''
        end
        doc.replace("$tancaments_verticals$", word_tancaments)

        # Coberta
        def llista_terrat(element_terrat)
          if @edifici.coberta.terrat_aillament_termic == true
            text_aillament = ' amb aïllament tèrmic'
          else
            text_aillament = ''
          end
          if @edifici.coberta.terrat_lamina_impermeabilitzant == true
            if @edifici.coberta.terrat_aillament_termic == true
              text_impermeabilitzacio = ' i làmina impermeabilitzant'
            else
              text_impermeabilitzacio = ' amb làmina impermeabilitzant'
            end
          else
            text_impermeabilitzacio = ''
          end
          text_terrat = element_terrat + text_aillament + text_impermeabilitzacio
          llista(text_terrat)
        end
        elements_coberta = ''
        existeix_coberta = false
        if @edifici.coberta.terrat_transitable == true
          elements_coberta = elements_coberta + llista_terrat('Terrat transitable')
          existeix_coberta = true
        end
        if @edifici.coberta.terrat_no_transitable == true
          elements_coberta = elements_coberta + llista_terrat('Terrat no transitable')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_teula_arab == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de teula àrab')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_teula_plana == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de teula plana')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_teula_ciment == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de teula de ciment')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_pissarra == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de pissarra')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_fibrociment == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de fibrociment')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_asfaltica == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de làmina asfàltica')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_xapa_acer == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de xapa d\'acer')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_xapa_coure == true
          elements_coberta = elements_coberta + llista_terrat('Coberta de xapa de coure')
          existeix_coberta = true
        end
        if @edifici.coberta.coberta_aillament_termic == true
          elements_coberta = elements_coberta + llista_terrat('Coberta amb aïllament tèrmic')
          existeix_coberta = true
        end

        if existeix_coberta == true || elements_extres('coberta') != ''
          word_coberta = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Coberta</w:t></w:r></w:p>' + elements_coberta + elements_extres('coberta')
        else
          word_coberta = ''
        end
        doc.replace("$coberta$", word_coberta)

        # Sanejament
        elements_sanejament = ''
        existeix_sanejament = false
        if @edifici.sanejament.no_sistema_evacuacio == true
          elements_sanejament = elements_sanejament + llista('No disposa de sistema d\'evacuació')
          existeix_sanejament = true
        end
        if @edifici.sanejament.si_sistema_evacuacio == true && @edifici.sanejament.fosa_septica == false
          elements_sanejament = elements_sanejament + llista('Disposa de sistema d\'evacuació')
          existeix_sanejament = true
        end
        if @edifici.sanejament.fosa_septica == true
          elements_sanejament = elements_sanejament + llista('Sistema d\'evacuació propi (fossa sèptica, etc.)')
          existeix_sanejament = true
        end
        if @edifici.sanejament.bomba_elevacio == true
          elements_sanejament = elements_sanejament + llista('Bomba d\'elevació')
          existeix_sanejament = true
        end
        if @edifici.sanejament.separador_greixos == true
          elements_sanejament = elements_sanejament + llista('Separador de greixos i fangs')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_ceramics == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos ceràmics')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_pvc == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos de PVC')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_fibrociment == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos de fibrociment')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_coure == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos de coure')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_alumini == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos d\'alumini')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_polipropile == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos de polipropilè')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_zinc == true
          elements_sanejament = elements_sanejament + llista('Baixants vistos de zinc')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_ceramics == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats ceràmics')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_pvc == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats de PVC')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_fibrociment == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats de fibrociment')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_coure == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats de coure')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_alumini == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats d\'alumini')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_polipropile == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats de polipropilè')
          existeix_sanejament = true
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_zinc == true
          elements_sanejament = elements_sanejament + llista('Baixants encastats de zinc')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_formigo == true
          elements_sanejament = elements_sanejament + llista('Col·lectors vistos de formigó')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_ceramic == true
          elements_sanejament = elements_sanejament + llista('Col·lectors vistos ceràmics')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_fibrociment == true
          elements_sanejament = elements_sanejament + llista('Col·lectors vistos de fibrociment')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_pvc == true
          elements_sanejament = elements_sanejament + llista('Col·lectors vistos de PVC')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_formigo == true
          elements_sanejament = elements_sanejament + llista('Col·lectors soterrats de formigó')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_ceramic == true
          elements_sanejament = elements_sanejament + llista('Col·lectors soterrats ceràmics')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_fibrociment == true
          elements_sanejament = elements_sanejament + llista('Col·lectors soterrats de fibrociment')
          existeix_sanejament = true
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_pvc == true
          elements_sanejament = elements_sanejament + llista('Col·lectors soterrats de PVC')
          existeix_sanejament = true
        end
        
        if existeix_sanejament == true || elements_extres('sanejament') != ''
          word_sanejament = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Sanejament</w:t></w:r></w:p>' + elements_sanejament + elements_extres('sanejament')
        else
          word_sanejament = ''
        end
        doc.replace("$sanejament$", word_sanejament)

        # Aigua
        elements_aigua = ''
        existeix_aigua = false
        if @edifici.aigua.connexio_directa == true
          elements_aigua = elements_aigua + llista('Disposa de connexió directa a xarxa pública de subministrament d\'aigua')
          existeix_aigua = true
        end
        if @edifici.aigua.connexio_aforament == true
          elements_aigua = elements_aigua + llista('Disposa de connexió per aforament a xarxa pública de subministrament d\'aigua')
          existeix_aigua = true
        end
        if @edifici.aigua.captacio_propia == true
          elements_aigua = elements_aigua + llista('Disposa de captació pròpia (pou, bomba, etc.)')
          existeix_aigua = true
        end
        if @edifici.aigua.grup_pressio == true
          elements_aigua = elements_aigua + llista('Disposa de grup de pressió')
          existeix_aigua = true
        end
        if @edifici.aigua.comptador_unic == true
          elements_aigua = elements_aigua + llista('Comptador únic per tot l\'edifici')
          existeix_aigua = true
        end
        if @edifici.aigua.comptadors_individuals_habitatge == true
          elements_aigua = elements_aigua + llista('Comptadors individuals per habitatge/local')
          existeix_aigua = true
        end
        if @edifici.aigua.comptadors_individuals_centralitzats == true
          elements_aigua = elements_aigua + llista('Comptadors individuals centralitzats')
          existeix_aigua = true
        end
        if @edifici.aigua.muntants_plom == true
          elements_aigua = elements_aigua + llista('Muntants de plom')
          existeix_aigua = true
        end
        if @edifici.aigua.muntants_ferro == true
          elements_aigua = elements_aigua + llista('Muntants de ferro')
          existeix_aigua = true
        end
        if @edifici.aigua.muntants_coure == true
          elements_aigua = elements_aigua + llista('Muntants de coure')
          existeix_aigua = true
        end
        if @edifici.aigua.muntants_plastic == true
          elements_aigua = elements_aigua + llista('Muntants de plàstic')
          existeix_aigua = true
        end
        
        if existeix_aigua == true || elements_extres('aigua') != ''
          word_aigua = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Subministrament d\'aigua</w:t></w:r></w:p>' + elements_aigua + elements_extres('aigua')
        else
          word_aigua = ''
        end
        doc.replace("$subministrament_aigua$", word_aigua)

        # Electricitat
        elements_electricitat = ''
        existeix_electricitat = false
        if @edifici.electricitat.enllumenat_comunitari == true
          elements_electricitat = elements_electricitat + llista('Disposa d\'enllumenat comunitari')
          existeix_electricitat = true
        end
        if @edifici.electricitat.connexio_terra == true
          elements_electricitat = elements_electricitat + llista('Disposa de connexió a terra')
          existeix_electricitat = true
        end
        if @edifici.electricitat.centre_transformacio == true
          elements_electricitat = elements_electricitat + llista('Hi ha un centre de transformació a l\'edifici')
          existeix_electricitat = true
        end
        if @edifici.electricitat.fotovoltaica == true
          elements_electricitat = elements_electricitat + llista('Disposa d\'instal·lació solar fotovoltaica')
          existeix_electricitat = true
        end
        if @edifici.electricitat.comptador_unic == true
          elements_electricitat = elements_electricitat + llista('Comptador únic per tot l\'edifici')
          existeix_electricitat = true
        end
        if @edifici.electricitat.comptadors_individuals_habitatge == true
          elements_electricitat = elements_electricitat + llista('Comptadors individuals per habitatge/local')
          existeix_electricitat = true
        end
        if @edifici.electricitat.comptadors_centralitzats == true
          elements_electricitat = elements_electricitat + llista('Comptadors centralitzats')
          existeix_electricitat = true
        end

        if existeix_electricitat == true || elements_extres('electricitat') != ''
          word_electricitat = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Instal·lació elèctrica</w:t></w:r></w:p>' + elements_electricitat + elements_extres('electricitat')
        else
          word_electricitat = ''
        end
        doc.replace("$instalacio_electrica$", word_electricitat)

        # Gas
        elements_gas = ''
        existeix_gas = false
        if @edifici.ga.instalacio_gas == true
          elements_gas = elements_gas + llista('Escomesa a xarxa de distribució canalitzada de gas per a ús domèstic')
          existeix_gas = true
        end
        if @edifici.ga.diposit_aire_lliure == true
          elements_gas = elements_gas + llista('Dipòsit de gas propà a l\'aire lliure')
          existeix_gas = true
        end
        if @edifici.ga.diposit_enterrat == true
          elements_gas = elements_gas + llista('Dipòsit de gas propà enterrat')
          existeix_gas = true
        end

        if existeix_gas == true || elements_extres('gas') != ''
          word_gas = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Instal·lació de gas</w:t></w:r></w:p>' + elements_gas + elements_extres('gas')
        else
          word_gas = ''
        end
        doc.replace("$instalacio_gas$", word_gas)

        # Climatitzacio
        elements_climatitzacio = ''
        existex_climatitzacio = false
        if @edifici.climatitzacio.escalfador_pn_menor_24 == true
          elements_climatitzacio = elements_climatitzacio + llista('Escalfador d\'aigua calenta sanitària (Pn ≤ 24,4 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.escalfador_pn_24_70 == true
          elements_climatitzacio = elements_climatitzacio + llista('Escalfador d\'aigua calenta sanitària (24,4 kW < Pn ≤ 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.escalfador_pn_major_70 == true
          elements_climatitzacio = elements_climatitzacio + llista('Escalfador d\'aigua calenta sanitària (Pn > 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.caldera_gas_pn_menor_70 == true
          elements_climatitzacio = elements_climatitzacio + llista('Caldera a gas (Pn ≤ 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.caldera_gas_pn_major_70 == true
          elements_climatitzacio = elements_climatitzacio + llista('Caldera a gas (Pn > 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.caldera_biomassa == true
          elements_climatitzacio = elements_climatitzacio + llista('Caldera a biomassa')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.caldera_solar_termica == true
          elements_climatitzacio = elements_climatitzacio + llista('Caldera amb instal·lació d’energia solar tèrmica')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.altres_pn_menor_70 == true
          elements_climatitzacio = elements_climatitzacio + llista('Caldera (Pn ≤ 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.altres_pn_major_70 == true
          elements_climatitzacio = elements_climatitzacio + llista('Caldera (Pn > 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_menor_12_autonoms == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb equips autònoms (Pn ≤ 12 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_menor_12_torres == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb torre de refrigeració (Pn ≤ 12 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_menor_12_recuperador == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb recuperador de calor (Pn ≤ 12 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_12_70_autonoms == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb equips autònoms (12 kW < Pn ≤ 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_12_70_torres == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb torre de refrigeració (12 kW < Pn ≤ 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_12_70_recuperador == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb recuperador de calor (12 kW < Pn ≤ 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_major_70_autonoms == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb equips autònoms (Pn > 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_major_70_torres == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb torre de refrigeració (Pn > 70 kW)')
          existeix_climatitzacio = true
        end
        if @edifici.climatitzacio.clima_pn_major_70_recuperador == true
          elements_climatitzacio = elements_climatitzacio + llista('Sistema de climatització amb recuperador de calor (Pn > 70 kW)')
          existeix_climatitzacio = true
        end

        if existeix_climatitzacio == true || elements_extres('climatitzacio') != ''
          word_climatitzacio = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>ACS, calefacció i refrigeració</w:t></w:r></w:p>' + elements_climatitzacio + elements_extres('climatitzacio')
        else
          word_climatitzacio = ''
        end
        doc.replace("$climatitzacio$", word_climatitzacio)

        # Ventilació
        elements_ventilacio = ''
        existeix_ventilacio = false
        if @edifici.ventilacio.habitatge_natural_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Natural per conductes en habitatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.habitatge_natural_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Natural per obertures en habitatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.habitatge_mecanica_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per conductes en habitatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.habitatge_mecanica_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per obertures en habitatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.habitatge_mecanica_control == true
          elements_ventilacio = elements_ventilacio + llista('Sistema de control de la ventilació en habitatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.traster_natural_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Natural per conductes en traster')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.traster_natural_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Natural per obertures en traster')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.traster_mecanica_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per conductes en traster')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.traster_mecanica_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per obertures en traster')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.traster_mecanica_control == true
          elements_ventilacio = elements_ventilacio + llista('Sistema de control de la ventilació en traster')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.magatzem_natural_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Natural per conductes en magatzem')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.magatzem_natural_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Natural per obertures en magatzem')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.magatzem_mecanica_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per conductes en magatzem')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.magatzem_mecanica_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per obertures en magatzem')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.magatzem_mecanica_control == true
          elements_ventilacio = elements_ventilacio + llista('Sistema de control de la ventilació en magatzem')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.garatge_natural_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Natural per conductes en garatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.garatge_natural_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Natural per obertures en garatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.garatge_mecanica_conductes == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per conductes en garatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.garatge_mecanica_obertures == true
          elements_ventilacio = elements_ventilacio + llista('Mecànica per obertures en garatge')
          existeix_ventilacio = true
        end
        if @edifici.ventilacio.garatge_mecanica_control == true
          elements_ventilacio = elements_ventilacio + llista('Sistema de control de la ventilació en garatge')
          existeix_ventilacio = true
        end

        if existeix_ventilacio == true || elements_extres('ventilacio') != ''
          word_ventilacio = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Ventilació</w:t></w:r></w:p>' + elements_ventilacio + elements_extres('ventilacio')
        else
          word_ventilacio = ''
        end
        doc.replace("$ventilacio$", word_ventilacio)

        # Protecció contra incendis
        elements_incendis = ''
        existeix_incendis = false
        if @edifici.incendi.alarma_automatica == true
          elements_incendis = elements_incendis + llista('Sistema automàtic de detecció i alarma d\'incendis')
          existeix_incendis = true
        end
        if @edifici.incendi.alarma_manual == true
          elements_incendis = elements_incendis + llista('Sistema manual d\'alarma d\'incendis')
          existeix_incendis = true
        end
        if @edifici.incendi.extintors == true
          elements_incendis = elements_incendis + llista('Extintors d\'incendis')
          existeix_incendis = true
        end
        if @edifici.incendi.abastiment_aigua == true
          elements_incendis = elements_incendis + llista('Sistema d\'abastiment d\'aigua contra incendis')
          existeix_incendis = true
        end
        if @edifici.incendi.bie == true
          elements_incendis = elements_incendis + llista('Boca d\'incendis equipada (BIE)')
          existeix_incendis = true
        end
        if @edifici.incendi.hidrants == true
          elements_incendis = elements_incendis + llista('Hidrants')
          existeix_incendis = true
        end
        if @edifici.incendi.ruixadors == true
          elements_incendis = elements_incendis + llista('Sistemes fixes d’extinció (ruixadors)')
          existeix_incendis = true
        end
        if @edifici.incendi.columnes_seques == true
          elements_incendis = elements_incendis + llista('Columnes seques')
          existeix_incendis = true
        end
        if @edifici.incendi.parallamps == true
          elements_incendis = elements_incendis + llista('Parallamps')
          existeix_incendis = true
        end
        
        if existeix_incendis == true || elements_extres('incendis') != ''
          word_incendis = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Protecció contra incendis</w:t></w:r></w:p>' + elements_incendis + elements_extres('incendis')
        else
          word_incendis = ''
        end
        doc.replace("$incendis$", word_incendis)

        # Ascensor
        elements_ascensor = ''
        existeix_ascensor = false
        if @edifici.ascensor.habitatge_unifamiliar == true || @edifici.ascensor.edifici_comunitari == true || @edifici.ascensor.mes_20_plantes == true || @edifici.ascensor.altres == true
          elements_ascensor = elements_ascensor + llista('L\'edifici disposa d\'ascensor')
          existeix_ascensor = true
        end
        
        if existeix_ascensor == true || elements_extres('ascensor') != ''
          word_ascensor = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Ascensor</w:t></w:r></w:p>' + elements_ascensor + elements_extres('ascensor')
        else
          word_ascensor = ''
        end
        doc.replace("$ascensors$", word_ascensor)

        # Telecomunicacions
        elements_telecomunicacions = ''
        existeix_telecomunicacions = false
        if @edifici.telecomunicacio.porter_audio == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Porter electrònic amb sistema d\'àudio')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.porter_video == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Porter electrònic amb sistema d\'àudio i vídeo')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.antena_individual == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Antena individual i xarxa coaxial')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.antena_colectiva == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Antena col·lectiva i xarxa coaxial')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.parabolica_individual == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Antena parabòlica individual')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.parabolica_colectiva == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Antena parabòlica col·lectiva')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.telefonia == true
          elements_telecomunicacions = elements_telecomunicacions + llista('Instal·lació de telefonia')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.riti == true
          elements_telecomunicacions = elements_telecomunicacions + llista('RITI (Recinte d’instal·lacions de telecomunicacions inferior)')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.rits == true
          elements_telecomunicacions = elements_telecomunicacions + llista('RITS (Recinte d’instal·lacions de telecomunicacions superior)')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.ritu == true
          elements_telecomunicacions = elements_telecomunicacions + llista('RITU (Recinte d’instal·lacions de telecomunicacions únic)')
          existeix_telecomunicacions = true
        end
        if @edifici.telecomunicacio.ritm == true
          elements_telecomunicacions = elements_telecomunicacions + llista('RITM (Recinte d’instal·lacions de telecomunicacions únic modular prefabricat)')
          existeix_telecomunicacions = true
        end

        if existeix_telecomunicacions == true || elements_extres('telecomunicacions') != ''
          word_telecomunicacions = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Instal·lació de telecomunicacions</w:t></w:r></w:p>' + elements_telecomunicacions + elements_extres('telecomunicacions')
        else
          word_telecomunicacions = ''
        end
        doc.replace("$telecomunicacions$", word_telecomunicacions)

        # Especials
        elements_especials = ''
        existeix_especials = false
        if @edifici.especial.piscina_estructura_obra == true || @edifici.especial.piscina_estructura_composite == true || @edifici.especial.piscina_estructura_acer == true
          if @edifici.especial.piscina_estructura_obra == true
            text_piscina_estructura = 'amb estructura d\'obra'
          elsif @edifici.especial.piscina_estructura_composite == true
            text_piscina_estructura = 'amb estructura de materials composites'
          elsif @edifici.especial.piscina_estructura_acer == true
            text_piscina_estructura = 'amb estructura d\'acer'
          end
          if @edifici.especial.piscina_vores_formigo == true
            text_piscina_vores = ", vores de formigó"
          elsif @edifici.especial.piscina_vores_pedra == true
            text_piscina_vores = ", vores de pedra"
          end
          if @edifici.especial.piscina_ceramica == true
            text_piscina_revestiment = ", revestiment de peces ceràmiques"
          elsif @edifici.especial.piscina_resines == true
            text_piscina_revestiment = ", revestiment de resines sintètiques"
          elsif @edifici.especial.piscina_porcellana == true
            text_piscina_revestiment = ", revestiment de porcellana"
          end

          text_piscina = 'Piscina ' + text_piscina_estructura + text_piscina_revestiment + text_piscina_vores
          elements_especials = elements_especials + llista(text_piscina)
          existeix_especials = true
        end
        if @edifici.especial.piscina_climatitzacio == true 
          elements_especials = elements_especials + llista('La piscina disposa d\'instal·lació de climatització')
          existeix_especials = true
        end
        if @edifici.especial.piscina_iluminacio == true 
          elements_especials = elements_especials + llista('La piscina disposa d\'instal·lació d\'il·luminació submergida')
          existeix_especials = true
        end
        if @edifici.especial.piscina_purificador == true 
          elements_especials = elements_especials + llista('La piscina disposa d\'instal·lació de purificació d\'aigües')
          existeix_especials = true
        end 
        
        if existeix_especials == true || elements_extres('especials') != ''
          word_especials = '<w:p w14:paraId="2EF68265" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00BB14EB"><w:pPr><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr></w:pPr><w:r><w:rPr><w:b/><w:lang w:val="es-ES"/></w:rPr><w:t>Elements especials</w:t></w:r></w:p>' + elements_especials + elements_extres('especials')
        else
          word_especials = ''
        end
        doc.replace("$instalacions_especials$", word_especials)

        # Operacions
        @referencies = Referencia.where(:edifici_id => @edifici.id)
        
        def taula_operacio(text_operacio, periodicitat, responsable)
          return '<w:tbl><w:tblPr><w:tblStyle w:val="TableGrid"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4505"/><w:gridCol w:w="4505"/></w:tblGrid><w:tr w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w14:paraId="2F242C4A" w14:textId="77777777" w:rsidTr="007760AC"><w:tc><w:tcPr><w:tcW w:w="9010" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="3A216B75" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + text_operacio + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w14:paraId="6B79A2E9" w14:textId="77777777" w:rsidTr="007760AC"><w:tc><w:tcPr><w:tcW w:w="4505" w:type="dxa"/></w:tcPr><w:p w14:paraId="19C3E2FC" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="titoltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>Periodicitat:</w:t></w:r></w:p><w:p w14:paraId="1C7E4A46" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + periodicitat + '</w:t></w:r></w:p><w:p w14:paraId="0AE797B2" w14:textId="77777777" w:rsidR="00B2670D" w:rsidRPr="007A1BE6" w:rsidRDefault="00B2670D" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4505" w:type="dxa"/></w:tcPr><w:p w14:paraId="71B33957" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="titoltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>Responsable:</w:t></w:r></w:p><w:p w14:paraId="03ABA8DC" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + responsable + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="164C8435" w14:textId="77777777" w:rsidR="00BA0778" w:rsidRDefault="00BA0778"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr></w:p><w:p w14:paraId="519C4981" w14:textId="77777777" w:rsidR="00372FF1" w:rsidRPr="007A1BE6" w:rsidRDefault="00372FF1"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr></w:p><w:sectPr w:rsidR="00372FF1" w:rsidRPr="007A1BE6" w:rsidSect="00017EF3"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
        end

        # Fonamentació
        referencies_fonamentacio = @referencies.where(:sistema => 'fonamentacio').pluck(:operacio_id)
        operacions_fonamentacio = Operacio.find(referencies_fonamentacio)
        word_operacions_fonamentacio = ''
        operacions_fonamentacio.each do |operacio|
          word_operacions_fonamentacio = word_operacions_fonamentacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_fonaments$", word_operacions_fonamentacio)

        # Estructura
        referencies_estructura = @referencies.where(:sistema => 'estructura').pluck(:operacio_id)
        operacions_estructura = Operacio.find(referencies_estructura)
        word_operacions_estructura = ''
        operacions_estructura.each do |operacio|
          word_operacions_estructura = word_operacions_estructura + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_estructura$", word_operacions_estructura)

        # Tancaments verticals
        referencies_tancaments_verticals = @referencies.where(:sistema => 'tancaments').pluck(:operacio_id)
        operacions_tancaments_verticals = Operacio.find(referencies_tancaments_verticals)
        word_operacions_tancaments_verticals = ''
        operacions_tancaments_verticals.each do |operacio|
          word_operacions_tancaments_verticals = word_operacions_tancaments_verticals + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_tancaments_verticals$", word_operacions_tancaments_verticals)

        # Coberta
        referencies_coberta = @referencies.where(:sistema => 'cobertes').pluck(:operacio_id)
        operacions_coberta = Operacio.find(referencies_coberta)
        word_operacions_coberta = ''
        operacions_coberta.each do |operacio|
          word_operacions_coberta = word_operacions_coberta + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_cobertes$", word_operacions_coberta)

        # Subministrament d'aigua
        referencies_aigua = @referencies.where(:sistema => 'aigua').pluck(:operacio_id)
        operacions_aigua = Operacio.find(referencies_aigua)
        word_operacions_aigua = ''
        operacions_aigua.each do |operacio|
          word_operacions_aigua = word_operacions_aigua + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_aigua$", word_operacions_aigua)

        # Instal·lació elèctrica
        referencies_electricitat = @referencies.where(:sistema => 'electricitat').pluck(:operacio_id)
        operacions_electricitat = Operacio.find(referencies_electricitat)
        word_operacions_electricitat = ''
        operacions_electricitat.each do |operacio|
          word_operacions_electricitat = word_operacions_electricitat + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_electricitat$", word_operacions_electricitat)
        

        # Instal·lació de gas
        referencies_gas = @referencies.where(:sistema => 'gas').pluck(:operacio_id)
        operacions_gas = Operacio.find(referencies_gas)
        word_operacions_gas = ''
        operacions_gas.each do |operacio|
          word_operacions_gas = word_operacions_gas + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        text_gas = ''
        if operacions_gas.count > 0
          text_gas = '<w:p w14:paraId="723E6F3D" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:t>Instal·lació de gas</w:t></w:r></w:p><w:p w14:paraId="603E71F7" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"/><w:p w14:paraId="56A705D8" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions d\'ús:</w:t></w:r></w:p><w:p w14:paraId="609805A2" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>Precaucions</w:t></w:r></w:p><w:p w14:paraId="431D13B5" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>Les canonades de gas no s’han d’utilitzar com a preses de terra d’aparells elèctrics ni tampoc per penjar objectes.</w:t></w:r></w:p><w:p w14:paraId="4D89EA42" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t xml:space="preserve">Es recomana que en absències prolongades es tanqui la clau de </w:t></w:r><w:proofErr w:type="gramStart"/><w:r><w:t>pas</w:t></w:r><w:proofErr w:type="gramEnd"/><w:r><w:t xml:space="preserve"> general de la instal·lació de gas de l’habitatge o local. També és convenient tancar-la durant la nit.</w:t></w:r></w:p><w:p w14:paraId="3EECC835" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>Els tubs flexibles de connexió del gas als aparells no hauran de tenir una longitud superior a 1,50 metres i han de portar imprès el període de vigència, que no ha d’haver caducat. És important assegurar-se que el tub flexible i les connexions de l’aparell estiguin acoblades directament i no ballin. Han de subjectar-se els extrems mitjançant unes abraçadores. No ha d’estar en contacte amb cap superfície calenta, com per exemple a prop del forn.</w:t></w:r></w:p><w:p w14:paraId="1CC9781E" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>En cas de fuita</w:t></w:r></w:p><w:p w14:paraId="7811C8B9" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t xml:space="preserve">Si es detecta una fuita de gas, s’haurà de tancar la clau de </w:t></w:r><w:proofErr w:type="gramStart"/><w:r><w:t>pas</w:t></w:r><w:proofErr w:type="gramEnd"/><w:r><w:t xml:space="preserve"> general de la instal·lació del pis o local, ventilar l’espai, no encendre llumins, no prémer timbres ni commutadors elèctrics i evitar les espurnes.</w:t></w:r></w:p><w:p w14:paraId="5D4E5964" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>Haurà d’avisar immediatament a una empresa instal·ladora de gas autoritzada o al servei d’urgències de la companyia. Sobretot, no s’han d’obrir o tancar els interruptors de llum ja que produeixen espurnes.</w:t></w:r></w:p><w:p w14:paraId="21C838A8" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>Responsabilitats</w:t></w:r></w:p><w:p w14:paraId="19324B04" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>El manteniment de les instal·lacions situades entre la clau d’entrada de l’immoble i el comptador correspon al propietari de l’immoble o a la Comunitat de Propietaris.</w:t></w:r></w:p><w:p w14:paraId="3974A4F5" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>La cambra de comptadors serà accessible només per al porter o vigilant, i el personal de la companyia subministradora o de manteniment. S’ha de vigilar que les reixes de ventilació no estiguin obstruïdes, així com també l’accés a la cambra.</w:t></w:r></w:p><w:p w14:paraId="4AE90FF0" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>Si es desitja donar subministrament a altres aparells diferents dels instal·lats, s’ha de demanar permís a la propietat de l’immoble o a la Comunitat de Propietaris. La instal·lació de nous aparells l’ha de fer una empresa instal·ladora de gas autoritzada.</w:t></w:r></w:p><w:p w14:paraId="6A154838" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>S’han de llegir atentament les instruccions dels aparells de gas, proporcionades pels seus fabricants, abans d’utilitzar-los per primera vegada.</w:t></w:r></w:p><w:p w14:paraId="4D808AF9" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t>El grau de perillositat d’aquesta instal·lació és superior a les altres, per la qual cosa s’extremaran les mesures de seguretat.</w:t></w:r></w:p><w:p w14:paraId="57604B3F" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:lastRenderedPageBreak/><w:t xml:space="preserve">Els titulars de les instal·lacions receptores han de poder provocar el bon estat d\'ús i conservació de les instal·lacions mitjançant l\'obtenció del certificat de la revisió corresponent, que hauran de presentar a requeriment de l\'administració o de la persona que realitzi la revisió periòdica següent. </w:t></w:r></w:p><w:p w14:paraId="24339318" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRPr="004A22F5" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:r><w:t xml:space="preserve">El gas natural és menys pesat que l’aire i, per tant, en cas de fuita es concentra a les parts altes. Són necessàries les dues escletxes de ventilació, a la part inferior i superior de la paret que doni a l’exterior d’aquella habitació on es trobi la instal·lació, per tal de crear circulació de l’aire i, per tant, no es poden tapar. </w:t></w:r></w:p><w:p w14:paraId="699EC613" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="0B21B640" w14:textId="77777777" w:rsidR="00025D1E" w:rsidRDefault="00025D1E" w:rsidP="00025D1E"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions de manteniment:</w:t></w:r></w:p>'
        end
        doc.replace("$text_gas$", text_gas)
        doc.replace("$operacions_gas$", word_operacions_gas)

        # Climatitzacio
        referencies_climatitzacio = @referencies.where(:sistema => 'climatitzacio').pluck(:operacio_id)
        operacions_climatitzacio = Operacio.find(referencies_climatitzacio)
        word_operacions_climatitzacio = ''
        operacions_climatitzacio.each do |operacio|
          word_operacions_climatitzacio = word_operacions_climatitzacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_climatitzacio$", word_operacions_climatitzacio)

        # Ventilacio
        referencies_ventilacio = @referencies.where(:sistema => 'ventilacio').pluck(:operacio_id)
        operacions_ventilacio = Operacio.find(referencies_ventilacio)
        word_operacions_ventilacio = ''
        operacions_ventilacio.each do |operacio|
          word_operacions_ventilacio = word_operacions_ventilacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        text_ventilacio = ''
        if operacions_ventilacio.count > 0
          text_ventilacio = '<w:p w14:paraId="7D59F865" w14:textId="77777777" w:rsidR="00916AE4" w:rsidRDefault="00916AE4" w:rsidP="00916AE4"><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:t>Ventilació</w:t></w:r></w:p><w:p w14:paraId="7F9B43BB" w14:textId="77777777" w:rsidR="00916AE4" w:rsidRDefault="00916AE4" w:rsidP="00916AE4"/><w:p w14:paraId="028265AF" w14:textId="77777777" w:rsidR="00916AE4" w:rsidRDefault="00916AE4" w:rsidP="00916AE4"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions d\'ús:</w:t></w:r></w:p><w:p w14:paraId="5F838AB8" w14:textId="77777777" w:rsidR="00916AE4" w:rsidRPr="00B04FDC" w:rsidRDefault="00916AE4" w:rsidP="00916AE4"><w:r w:rsidRPr="00B04FDC"><w:t>Una bona ventilació és necessària a tots els edificis. Els espais interiors dels habitatges han de ventilar-se periòdicament per tal d’evitar humitats de condensació. La ventilació s’ha de fer preferentment a hores de sol, durant 20 o 30 minuts. És millor ventilar els dormitoris a primera hora del matí. Hi ha estances que per les seves característiques necessiten més ventilació que altres, com és el cas de les cuines i els banys. Per aquest motiu, en ocasions la ventilació es fa per mitjà de conductes, i en ocasions s’utilitz</w:t></w:r><w:r><w:t xml:space="preserve">en extractors per millorar-la. </w:t></w:r></w:p><w:p w14:paraId="546D8BC3" w14:textId="77777777" w:rsidR="00916AE4" w:rsidRDefault="00916AE4" w:rsidP="00916AE4"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="09979D4C" w14:textId="77777777" w:rsidR="00916AE4" w:rsidRDefault="00916AE4" w:rsidP="00916AE4"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions de manteniment:</w:t></w:r></w:p>'
        end
        doc.replace("$text_ventilacio$", text_ventilacio)
        doc.replace("$operacions_ventilacio$", word_operacions_ventilacio)

        # Incendis
        referencies_incendis = @referencies.where(:sistema => 'incendis').pluck(:operacio_id)
        operacions_incendis = Operacio.find(referencies_incendis)
        word_operacions_incendis = ''
        operacions_incendis.each do |operacio|
          word_operacions_incendis = word_operacions_incendis + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        text_incendis = ''
        if operacions_incendis.count > 0
          text_incendis = '<w:p w14:paraId="5A54A62E" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:t>Protecció contra incendis</w:t></w:r></w:p><w:p w14:paraId="7C780DBF" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"/><w:p w14:paraId="24B44CD4" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions d\'ús:</w:t></w:r></w:p><w:p w14:paraId="33F41EFB" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:r><w:t>Aquestes instal·lacions són de prevenció i no s’utilitzen durant la vida normal de l’edifici, però la seva manca d’ús pot afavorir les avaries, per tant és necessari seguir les instruccions de manteniment periòdic correctament.</w:t></w:r></w:p><w:p w14:paraId="37556557" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:r><w:t>En cas de dur a terme proves de funcionament o simulacres d’emergència, s’haurà de comunicar amb l’antelació necessària als usuaris de l’edifici per tal d’evitar situacions de pànic.</w:t></w:r></w:p><w:p w14:paraId="621D927F" w14:textId="77777777" w:rsidR="004A040F" w:rsidRPr="00B04FDC" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:r><w:t xml:space="preserve">Segons el tipus d’edifici, és necessari disposar d’un pla d’emergència, que ha d’estar aprovat per les autoritats competents. És recomanable que tots els usuaris de l’edifici coneguin l’existència dels elements de protecció de què es disposa i les instruccions per al seu ús correcte. </w:t></w:r></w:p><w:p w14:paraId="2389EE73" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="7D8D8339" w14:textId="77777777" w:rsidR="004A040F" w:rsidRDefault="004A040F" w:rsidP="004A040F"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions de manteniment:</w:t></w:r></w:p>'
        end
        doc.replace("$text_incendis$", text_incendis)
        doc.replace("$operacions_incendis$", word_operacions_incendis)

        # Ascensors
        referencies_ascensors = @referencies.where(:sistema => 'ascensor').pluck(:operacio_id)
        operacions_ascensors = Operacio.find(referencies_ascensors)
        word_operacions_ascensors = ''
        operacions_ascensors.each do |operacio|
          word_operacions_ascensors = word_operacions_ascensors + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        text_ascensors = ''
        if operacions_ascensors.count > 0
          text_ascensors = '<w:p w14:paraId="130A5642" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:t>Ascensors</w:t></w:r></w:p><w:p w14:paraId="0E9BF05B" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"/><w:p w14:paraId="0F608663" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions d\'ús:</w:t></w:r></w:p><w:p w14:paraId="051047B4" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>Algú s’ha de fer responsable del funcionament de la instal·lació. Normalment és el president de la Comunitat de Propietaris o el conserge.</w:t></w:r></w:p><w:p w14:paraId="5C9B7FA8" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>El manteniment de la instal·lació d’ascensors s’ha d’encarregar a una empresa especialitzada, mitjançant un contracte. Aquesta empresa enregistrarà les dates de visita, el resultat de les inspeccions i les incidències en un Llibre de Registre de Revisions, el qual romandrà en poder del responsable de la instal·lació.</w:t></w:r></w:p><w:p w14:paraId="547D43DF" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>La cambra de màquines serà accessible només per al porter o vigilant, i el personal de manteniment. S’ha de vigilar que les reixes de ventilació no estiguin obstruïdes, així com tampoc l’accés a la cambra.</w:t></w:r></w:p><w:p w14:paraId="64A194CE" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>Precaucions</w:t></w:r></w:p><w:p w14:paraId="25D69807" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>Els ascensors no poden ser utilitzats per nens que no vagin acompanyats de persones adultes.</w:t></w:r></w:p><w:p w14:paraId="3492FB51" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>L’ascensor pot suportar un pes limitat i un nombre màxim de persones (indicats a la cabina i a l’apartat anterior). Aquesta limitació s’ha de respectar per tal d’evitar accidents. Els ascensors no es poden utilitzar com a muntacàrregues.</w:t></w:r></w:p><w:p w14:paraId="05C023CD" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t>Si s’observa qualsevol anomalia (les portes s’obren en mig del recorregut, l’ascensor s’atura quedant desnivellat respecte al replà, hi ha interruptors que no funcionen, etc.) s’haurà d’aturar el servei i avisar a l’empresa de manteniment.</w:t></w:r></w:p><w:p w14:paraId="372A2CFD" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRPr="00B04FDC" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:r><w:t xml:space="preserve">Si l’ascensor es queda sense electricitat, no s’ha d’intentar sortir de la cabina. S’ha d’esperar que es restableixi el subministrament d’electricitat o que la cabina es remunti manualment fins un replà. </w:t></w:r></w:p><w:p w14:paraId="680CC49E" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="4CDFD204" w14:textId="77777777" w:rsidR="00CC29D5" w:rsidRDefault="00CC29D5" w:rsidP="00CC29D5"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions de manteniment:</w:t></w:r></w:p>'
        end
        doc.replace("$text_ascensors$", text_ascensors)
        doc.replace("$operacions_ascensors$", word_operacions_ascensors)

        # Telecomunicacions
        referencies_telecomunicacions = @referencies.where(:sistema => 'telecomunicacions').pluck(:operacio_id)
        operacions_telecomunicacions = Operacio.find(referencies_telecomunicacions)
        word_operacions_telecomunicacions = ''
        operacions_telecomunicacions.each do |operacio|
          word_operacions_telecomunicacions = word_operacions_telecomunicacions + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        text_telecomunicacions = ''
        if operacions_telecomunicacions.count > 0
          text_telecomunicacions = '<w:p w14:paraId="504A99AA" w14:textId="77777777" w:rsidR="00A77128" w:rsidRDefault="00A77128" w:rsidP="00A77128"><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:t>Instal·lació de telecomunicacions</w:t></w:r></w:p><w:p w14:paraId="58F5E00E" w14:textId="77777777" w:rsidR="00A77128" w:rsidRDefault="00A77128" w:rsidP="00A77128"/><w:p w14:paraId="6BA155FF" w14:textId="77777777" w:rsidR="00A77128" w:rsidRDefault="00A77128" w:rsidP="00A77128"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions d\'ús:</w:t></w:r></w:p><w:p w14:paraId="276CFA78" w14:textId="77777777" w:rsidR="00A77128" w:rsidRDefault="00A77128" w:rsidP="00A77128"><w:r><w:t>El propietari de l\'immoble o la Comunitat de Propietaris són els responsables del manteniment de la part de la infraestructura comuna, entesa com a canalitzacions, compresa entre el punt d\'entrada general de la xarxa o l\'immoble i el registre d\'accés d\'usuari, així com adoptar les mesures necessàries per evitar l\'accés no autoritzat i la manipulació incorrecta de la infrastructura.</w:t></w:r></w:p><w:p w14:paraId="1AD1978D" w14:textId="77777777" w:rsidR="00A77128" w:rsidRPr="00EA5AF2" w:rsidRDefault="00A77128" w:rsidP="00A77128"><w:r><w:t xml:space="preserve">Així mateix, el propietari de l\'immoble o la Comunitat de Propietaris i l\'instal·lador responsable de les actuacions sobre l\'equipament d\'accés al servei de telecomunicacions per cable han de facilitar a la Direcció General de Radiodifusió i Televisió la realització de les instal·lacions que aquesta efectuï i, amb aquesta finalitat permetran l\'accés a les instal·lacions i a la documentació que els sigui requerida. </w:t></w:r></w:p><w:p w14:paraId="75AFBA69" w14:textId="77777777" w:rsidR="00A77128" w:rsidRDefault="00A77128" w:rsidP="00A77128"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="718F4534" w14:textId="77777777" w:rsidR="00A77128" w:rsidRDefault="00A77128" w:rsidP="00A77128"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions de manteniment:</w:t></w:r></w:p>'
        end
        doc.replace("$text_telecomunicacions$", text_telecomunicacions)
        doc.replace("$operacions_telecomunicacions$", word_operacions_telecomunicacions)

        # Especials
        referencies_especials = @referencies.where(:sistema => 'especials').pluck(:operacio_id)
        operacions_especials = Operacio.find(referencies_especials)
        word_operacions_especials = ''
        operacions_especials.each do |operacio|
          word_operacions_especials = word_operacions_especials + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        text_especials = ''
        if operacions_especials.count > 0
          text_especials = '<w:p w14:paraId="0D5F0AFE" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:t>Instal·lacions especials</w:t></w:r></w:p><w:p w14:paraId="12357257" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"/><w:p w14:paraId="277032B2" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions d\'ús:</w:t></w:r></w:p><w:p w14:paraId="1655AE42" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:r><w:t>Piscines:</w:t></w:r></w:p><w:p w14:paraId="700ADA6A" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:r><w:t>Tant a l’hivern com a l’estiu, és necessari dedicar alguna atenció als equips, accessoris, aigua i voltants de la piscina. S’ha d’evitar, en la mesura del possible, que a l’entorn de la piscina s’acumulin fulles o pols que la puguin embrutar.</w:t></w:r></w:p><w:p w14:paraId="6B69F670" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:r><w:t>El manteniment de l’aigua en bones condicions exigeix un tractament que controli la seva qualitat. Diàriament s’ha de comprovar el clor residual i el pH de l’aigua. Per altra banda, cal una desinfecció periòdica dels serveis de la piscina, com ara els banys, les dutxes, els sanitaris, etc. Els elements mínims necessaris per a un bon manteniment són: raspalls, recollidor de fulles, netejafons i equips d’assaigs d’aigua.</w:t></w:r></w:p><w:p w14:paraId="5B20101C" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRPr="00EA5AF2" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:r><w:t xml:space="preserve">Si es disposa d’equips de purificació i climatització, s’hauran de seguir les instruccions del fabricant per al seu correcte funcionament. </w:t></w:r></w:p><w:p w14:paraId="7816F1E3" w14:textId="77777777" w:rsidR="00456DDD" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="234A8B00" w14:textId="77777777" w:rsidR="00500DE7" w:rsidRDefault="00456DDD" w:rsidP="00456DDD"><w:r><w:rPr><w:b/></w:rPr><w:t>Instruccions de manteniment:</w:t></w:r><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p>'
        end
        doc.replace("$text_especials$", text_especials)
        doc.replace("$operacions_especials$", word_operacions_especials)  

        # Arxiu de documents
        arxiu = ChecklistNouPlurifamiliar.where(:edifici_id => @edifici.id).last
        
        word_titols_arxiu = ''

        def titol_apartat_arxiu(text_titol)
          return '<w:p w14:paraId="3E0880B3" w14:textId="77777777" w:rsidP="004F63F9" w:rsidR="004F63F9" w:rsidRDefault="004F63F9"><w:pPr><w:pStyle w:val="Heading1"/></w:pPr><w:bookmarkStart w:id="0" w:name="_Toc297976137"/><w:bookmarkStart w:id="1" w:name="_Toc424303768"/><w:bookmarkStart w:id="2" w:name="_Toc424303850"/><w:r><w:t>' + text_titol + '</w:t></w:r><w:bookmarkEnd w:id="0"/><w:bookmarkEnd w:id="1"/><w:bookmarkEnd w:id="2"/></w:p><w:p w14:paraId="673E3807" w14:textId="77777777" w:rsidR="004F63F9" w:rsidRDefault="004F63F9"><w:r><w:br w:type="page"/></w:r></w:p>'
        end

        if arxiu.llicencies_preceptives == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Llicències preceptives")
        end
        if arxiu.certificat_final_obra == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Certificat final d'obra")
        end
        if arxiu.acta_recepcio_obra == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Acta de recepció definitiva de l'obra")
        end
        if arxiu.escriptura_publica == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Escriptura pública de declaració d'obra nova")
        end
        if arxiu.documents_garantia == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Documents acreditatius de garantia")
        end
        if arxiu.documents_garantia_parts_comunes == true && @edifici.tipus_edifici == 'nou_plurifamiliar'
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Documents de garantia d'instal·lacions de parts comunes")
        end
        if arxiu.certificacio_energetica == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Certificació energètica")
        end
        if arxiu.polissa_assegurances == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Pòlisses d'assegurances")
        end
        if arxiu.escriptura_propietat_horitzontal == true && @edifici.tipus_edifici == 'nou_plurifamiliar'
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Escriptura de divisió en règim de propietat horitzontal")
        end
        if arxiu.estatus_comunitat == true && @edifici.tipus_edifici == 'nou_plurifamiliar'
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Estatuts de la comunitat de propietaris")
        end
        if arxiu.cedules_regims_juridics == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Cèdules de declaració de règims jurídics especials o qualificacions d'habitatges protegits")
        end
        if arxiu.carregues_reals == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Càrregues reals existents")
        end
        if arxiu.documents_acreditatius_ajuts == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Documents acreditatius dels ajuts i beneficis atorgats a l'edifici")
        end
        if arxiu.documents_justificacio_operacions == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Documents de justificació de la realització d'operacions de reparació, manteniment i rehabilitació")
        end
        if arxiu.certificat_final_obra_instalacions == true && @edifici.tipus_edifici == 'nou_plurifamiliar'
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Certificats final d’obra de les instal·lacions comunes de baixa tensió, gasos combustibles, productes petrolífers o instal·lacions tèrmiques")
        end
        if arxiu.declaracions_ce_ascensors == true
          word_titols_arxiu = word_titols_arxiu + titol_apartat_arxiu("Declaracions CE que reconeixen la conformitat dels ascensors instal·lats")
        end
        doc.replace("$titol_apartat_arxiu$", word_titols_arxiu)      

        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "#{@edifici.nom_edifici}.docx", disposition: 'attachment'
      end
    end
  end

  def manual_habitatge
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/manual.docx", "#{Rails.root}/tmp")
        # Adreça de l'edifici
        adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ' ' + @edifici.identificacio.bloc_edifici.to_s
        doc.replace("$adreca$", adreca)
        doc.replace("$codi_postal$", @edifici.identificacio.cp_edifici)
        doc.replace("$poblacio$", @edifici.identificacio.poblacio_edifici)
        doc.replace("$provincia$", @edifici.identificacio.provincia_edifici)

        # Operacions
        @referencies_manual = Referencia.where(:edifici_id => @edifici.id)
        
        def taula_operacio(text_operacio, periodicitat, responsable)
          return '<w:tbl><w:tblPr><w:tblStyle w:val="TableGrid"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4505"/><w:gridCol w:w="4505"/></w:tblGrid><w:tr w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w14:paraId="2F242C4A" w14:textId="77777777" w:rsidTr="007760AC"><w:tc><w:tcPr><w:tcW w:w="9010" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="3A216B75" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + text_operacio + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w14:paraId="6B79A2E9" w14:textId="77777777" w:rsidTr="007760AC"><w:tc><w:tcPr><w:tcW w:w="4505" w:type="dxa"/></w:tcPr><w:p w14:paraId="19C3E2FC" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="titoltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>Periodicitat:</w:t></w:r></w:p><w:p w14:paraId="1C7E4A46" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + periodicitat + '</w:t></w:r></w:p><w:p w14:paraId="0AE797B2" w14:textId="77777777" w:rsidR="00B2670D" w:rsidRPr="007A1BE6" w:rsidRDefault="00B2670D" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4505" w:type="dxa"/></w:tcPr><w:p w14:paraId="71B33957" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="titoltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>Responsable:</w:t></w:r></w:p><w:p w14:paraId="03ABA8DC" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + responsable + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="164C8435" w14:textId="77777777" w:rsidR="00BA0778" w:rsidRDefault="00BA0778"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr></w:p><w:p w14:paraId="519C4981" w14:textId="77777777" w:rsidR="00372FF1" w:rsidRPr="007A1BE6" w:rsidRDefault="00372FF1"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr></w:p><w:sectPr w:rsidR="00372FF1" w:rsidRPr="007A1BE6" w:rsidSect="00017EF3"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
        end

        # Estructura
        referencies_estructura = @referencies_manual.where(:sistema => 'estructura', :manual_habitatge => true).pluck(:operacio_id)
        operacions_estructura = Operacio.find(referencies_estructura)
        word_operacions_estructura = ''
        operacions_estructura.each do |operacio|
          word_operacions_estructura = word_operacions_estructura + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_estructura.count == 0
          word_operacions_estructura = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_estructura$", word_operacions_estructura)

        # Tancaments
        referencies_tancaments = @referencies_manual.where(:sistema => 'tancaments', :manual_habitatge => true).pluck(:operacio_id)
        operacions_tancaments = Operacio.find(referencies_tancaments)
        word_operacions_tancaments = ''
        operacions_tancaments.each do |operacio|
          word_operacions_tancaments = word_operacions_tancaments + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_tancaments.count == 0
          word_operacions_tancaments = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_tancaments$", word_operacions_tancaments)

        # Terrats
        referencies_terrats = @referencies_manual.where(:sistema => 'cobertes', :manual_habitatge => true).pluck(:operacio_id)
        operacions_terrats = Operacio.find(referencies_terrats)
        word_operacions_terrats = ''
        operacions_terrats.each do |operacio|
          word_operacions_terrats = word_operacions_terrats + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_terrats.count == 0
          word_operacions_terrats = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_terrats$", word_operacions_terrats)

        # Sanejament
        referencies_sanejament = @referencies_manual.where(:sistema => 'sanejament', :manual_habitatge => true).pluck(:operacio_id)
        operacions_sanejament = Operacio.find(referencies_sanejament)
        word_operacions_sanejament = ''
        operacions_sanejament.each do |operacio|
          word_operacions_sanejament = word_operacions_sanejament + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_sanejament.count == 0
          word_operacions_sanejament = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_sanejament$", word_operacions_sanejament)

        # Aigua
        referencies_aigua = @referencies_manual.where(:sistema => 'aigua', :manual_habitatge => true).pluck(:operacio_id)
        operacions_aigua = Operacio.find(referencies_aigua)
        word_operacions_aigua = ''
        operacions_aigua.each do |operacio|
          word_operacions_aigua = word_operacions_aigua + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_aigua.count == 0
          word_operacions_aigua = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_aigua$", word_operacions_aigua)

        # Electricitat
        referencies_electricitat = @referencies_manual.where(:sistema => 'electricitat', :manual_habitatge => true).pluck(:operacio_id)
        operacions_electricitat = Operacio.find(referencies_electricitat)
        word_operacions_electricitat = ''
        operacions_electricitat.each do |operacio|
          word_operacions_electricitat = word_operacions_electricitat + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_electricitat.count == 0
          word_operacions_electricitat = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_electricitat$", word_operacions_electricitat)

        # Gas
        referencies_gas = @referencies_manual.where(:sistema => 'gas', :manual_habitatge => true).pluck(:operacio_id)
        operacions_gas = Operacio.find(referencies_gas)
        word_operacions_gas = ''
        operacions_gas.each do |operacio|
          word_operacions_gas = word_operacions_gas + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_gas.count == 0
          word_operacions_gas = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_gas$", word_operacions_gas)

        # Climatitzacio
        referencies_climatitzacio = @referencies_manual.where(:sistema => 'climatitzacio', :manual_habitatge => true).pluck(:operacio_id)
        operacions_climatitzacio = Operacio.find(referencies_climatitzacio)
        word_operacions_climatitzacio = ''
        operacions_climatitzacio.each do |operacio|
          word_operacions_climatitzacio = word_operacions_climatitzacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_climatitzacio.count == 0
          word_operacions_climatitzacio = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_climatitzacio$", word_operacions_climatitzacio)

        # Ventilacio
        referencies_ventilacio = @referencies_manual.where(:sistema => 'ventilacio', :manual_habitatge => true).pluck(:operacio_id)
        operacions_ventilacio = Operacio.find(referencies_ventilacio)
        word_operacions_ventilacio = ''
        operacions_ventilacio.each do |operacio|
          word_operacions_ventilacio = word_operacions_ventilacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        if operacions_ventilacio.count == 0
          word_operacions_ventilacio = 'No hi ha operacions de manteniment previstes.'
        end
        doc.replace("$operacions_ventilacio$", word_operacions_ventilacio)


        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "Manual habitatge #{@edifici.nom_edifici}.docx", disposition: 'attachment'
      end
    end
  end

  def existents
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/existents.docx", "#{Rails.root}/tmp")
        # Adreça de l'edifici
        adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ' ' + @edifici.identificacio.bloc_edifici.to_s
        doc.replace("$adreca$", adreca)
        doc.replace("$adreca_edifici$", adreca)
        doc.replace("$codi_postal$", @edifici.identificacio.cp_edifici)
        doc.replace("$codi_postal_edifici$", @edifici.identificacio.cp_edifici)
        doc.replace("$poblacio$", @edifici.identificacio.poblacio_edifici)
        doc.replace("$poblacio_edifici$", @edifici.identificacio.poblacio_edifici)
        doc.replace("$provincia$", @edifici.identificacio.provincia_edifici)
        doc.replace("$provincia_edifici$", @edifici.identificacio.provincia_edifici)
        doc.replace("$referencia_cadastral$", @edifici.identificacio.ref_cadastral)
        doc.replace("$any_inici_construccio$", @edifici.identificacio.any_inici_construccio)
        doc.replace("$any_fi_construccio$", @edifici.identificacio.any_fi_construccio)
        
        # Operacions
        @referencies = Referencia.where(:edifici_id => @edifici.id)
        
        def taula_operacio(text_operacio, periodicitat, responsable)
          return '<w:tbl><w:tblPr><w:tblStyle w:val="TableGrid"/><w:tblW w:w="0" w:type="auto"/><w:tblBorders><w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/><w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/></w:tblBorders><w:tblLook w:val="04A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1" w:lastColumn="0" w:noHBand="0" w:noVBand="1"/></w:tblPr><w:tblGrid><w:gridCol w:w="4505"/><w:gridCol w:w="4505"/></w:tblGrid><w:tr w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w14:paraId="2F242C4A" w14:textId="77777777" w:rsidTr="007760AC"><w:tc><w:tcPr><w:tcW w:w="9010" w:type="dxa"/><w:gridSpan w:val="2"/></w:tcPr><w:p w14:paraId="3A216B75" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + text_operacio + '</w:t></w:r></w:p></w:tc></w:tr><w:tr w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w14:paraId="6B79A2E9" w14:textId="77777777" w:rsidTr="007760AC"><w:tc><w:tcPr><w:tcW w:w="4505" w:type="dxa"/></w:tcPr><w:p w14:paraId="19C3E2FC" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="titoltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>Periodicitat:</w:t></w:r></w:p><w:p w14:paraId="1C7E4A46" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + periodicitat + '</w:t></w:r></w:p><w:p w14:paraId="0AE797B2" w14:textId="77777777" w:rsidR="00B2670D" w:rsidRPr="007A1BE6" w:rsidRDefault="00B2670D" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:bookmarkStart w:id="0" w:name="_GoBack"/><w:bookmarkEnd w:id="0"/></w:p></w:tc><w:tc><w:tcPr><w:tcW w:w="4505" w:type="dxa"/></w:tcPr><w:p w14:paraId="71B33957" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="titoltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>Responsable:</w:t></w:r></w:p><w:p w14:paraId="03ABA8DC" w14:textId="77777777" w:rsidR="007A1BE6" w:rsidRPr="007A1BE6" w:rsidRDefault="007A1BE6" w:rsidP="007760AC"><w:pPr><w:pStyle w:val="normaltaula"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr><w:r w:rsidRPr="007A1BE6"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr><w:t>' + responsable + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="164C8435" w14:textId="77777777" w:rsidR="00BA0778" w:rsidRDefault="00BA0778"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr></w:p><w:p w14:paraId="519C4981" w14:textId="77777777" w:rsidR="00372FF1" w:rsidRPr="007A1BE6" w:rsidRDefault="00372FF1"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi"/></w:rPr></w:pPr></w:p><w:sectPr w:rsidR="00372FF1" w:rsidRPr="007A1BE6" w:rsidSect="00017EF3"><w:pgSz w:w="11900" w:h="16840"/><w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440" w:header="708" w:footer="708" w:gutter="0"/><w:cols w:space="708"/><w:docGrid w:linePitch="360"/></w:sectPr>'
        end

        # Fonamentació
        referencies_fonamentacio = @referencies.where(:sistema => 'fonamentacio').pluck(:operacio_id)
        operacions_fonamentacio = Operacio.find(referencies_fonamentacio)
        word_operacions_fonamentacio = ''
        operacions_fonamentacio.each do |operacio|
          word_operacions_fonamentacio = word_operacions_fonamentacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_fonaments$", word_operacions_fonamentacio)

        # Estructura
        referencies_estructura = @referencies.where(:sistema => 'estructura').pluck(:operacio_id)
        operacions_estructura = Operacio.find(referencies_estructura)
        word_operacions_estructura = ''
        operacions_estructura.each do |operacio|
          word_operacions_estructura = word_operacions_estructura + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_estructura$", word_operacions_estructura)

        # Tancaments verticals
        referencies_tancaments_verticals = @referencies.where(:sistema => 'tancaments').pluck(:operacio_id)
        operacions_tancaments_verticals = Operacio.find(referencies_tancaments_verticals)
        word_operacions_tancaments_verticals = ''
        operacions_tancaments_verticals.each do |operacio|
          word_operacions_tancaments_verticals = word_operacions_tancaments_verticals + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_tancaments_verticals$", word_operacions_tancaments_verticals)

        # Coberta
        referencies_coberta = @referencies.where(:sistema => 'cobertes').pluck(:operacio_id)
        operacions_coberta = Operacio.find(referencies_coberta)
        word_operacions_coberta = ''
        operacions_coberta.each do |operacio|
          word_operacions_coberta = word_operacions_coberta + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_cobertes$", word_operacions_coberta)

        # Subministrament d'aigua
        referencies_aigua = @referencies.where(:sistema => 'aigua').pluck(:operacio_id)
        operacions_aigua = Operacio.find(referencies_aigua)
        word_operacions_aigua = ''
        operacions_aigua.each do |operacio|
          word_operacions_aigua = word_operacions_aigua + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_aigua$", word_operacions_aigua)

        # Instal·lació elèctrica
        referencies_electricitat = @referencies.where(:sistema => 'electricitat').pluck(:operacio_id)
        operacions_electricitat = Operacio.find(referencies_electricitat)
        word_operacions_electricitat = ''
        operacions_electricitat.each do |operacio|
          word_operacions_electricitat = word_operacions_electricitat + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_electricitat$", word_operacions_electricitat)
        

        # Instal·lació de gas
        referencies_gas = @referencies.where(:sistema => 'gas').pluck(:operacio_id)
        operacions_gas = Operacio.find(referencies_gas)
        word_operacions_gas = ''
        operacions_gas.each do |operacio|
          word_operacions_gas = word_operacions_gas + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_gas$", word_operacions_gas)

        # Climatitzacio
        referencies_climatitzacio = @referencies.where(:sistema => 'climatitzacio').pluck(:operacio_id)
        operacions_climatitzacio = Operacio.find(referencies_climatitzacio)
        word_operacions_climatitzacio = ''
        operacions_climatitzacio.each do |operacio|
          word_operacions_climatitzacio = word_operacions_climatitzacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_climatitzacio$", word_operacions_climatitzacio)

        # Ventilacio
        referencies_ventilacio = @referencies.where(:sistema => 'ventilacio').pluck(:operacio_id)
        operacions_ventilacio = Operacio.find(referencies_ventilacio)
        word_operacions_ventilacio = ''
        operacions_ventilacio.each do |operacio|
          word_operacions_ventilacio = word_operacions_ventilacio + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_ventilacio$", word_operacions_ventilacio)

        # Incendis
        referencies_incendis = @referencies.where(:sistema => 'incendis').pluck(:operacio_id)
        operacions_incendis = Operacio.find(referencies_incendis)
        word_operacions_incendis = ''
        operacions_incendis.each do |operacio|
          word_operacions_incendis = word_operacions_incendis + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_incendis$", word_operacions_incendis)

        # Ascensors
        referencies_ascensors = @referencies.where(:sistema => 'ascensor').pluck(:operacio_id)
        operacions_ascensors = Operacio.find(referencies_ascensors)
        word_operacions_ascensors = ''
        operacions_ascensors.each do |operacio|
          word_operacions_ascensors = word_operacions_ascensors + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_ascensors$", word_operacions_ascensors)

        # Telecomunicacions
        referencies_telecomunicacions = @referencies.where(:sistema => 'telecomunicacions').pluck(:operacio_id)
        operacions_telecomunicacions = Operacio.find(referencies_telecomunicacions)
        word_operacions_telecomunicacions = ''
        operacions_telecomunicacions.each do |operacio|
          word_operacions_telecomunicacions = word_operacions_telecomunicacions + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_telecomunicacions$", word_operacions_telecomunicacions)

        # Especials
        referencies_especials = @referencies.where(:sistema => 'especials').pluck(:operacio_id)
        operacions_especials = Operacio.find(referencies_especials)
        word_operacions_especials = ''
        operacions_especials.each do |operacio|
          word_operacions_especials = word_operacions_especials + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_especials$", word_operacions_especials)  

        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "#{@edifici.nom_edifici}.docx", disposition: 'attachment'
      end
    end
  end

  def det
  end

  def manual
  end

  def arxiu
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
end
