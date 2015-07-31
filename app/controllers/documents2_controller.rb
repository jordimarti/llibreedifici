class DocumentsController < ApplicationController
  before_action :set_edifici
  layout 'edifici'

  def index
    @submenu_actiu = 'documents'
  end

  def quadern
    @menu_documents_actiu = 'quadern'
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
        # Fonamentació
        word_fonamentacio = ''
        if @edifici.fonamentacio.mur_pedra == true
          word_fonamentacio = word_fonamentacio + llista('Mur de contenció de pedra')
        end
        if @edifici.fonamentacio.mur_fabrica_mao == true
          word_fonamentacio = word_fonamentacio + llista('Mur de contenció de fàbrica de maó')
        end
        if @edifici.fonamentacio.mur_fabrica_bloc == true
          word_fonamentacio = word_fonamentacio + llista('Mur de contenció de fàbrica de bloc')
        end
        if @edifici.fonamentacio.mur_formigo_armat == true
          word_fonamentacio = word_fonamentacio + llista('Mur de contenció de formigó armat')
        end 
        if @edifici.fonamentacio.mur_pantalla == true
          word_fonamentacio = word_fonamentacio + llista('Mur pantalla')
        end 
        if @edifici.fonamentacio.sabates_paredat == true
          word_fonamentacio = word_fonamentacio + llista('Sabates de paredat')
        end 
        if @edifici.fonamentacio.sabates_formigo == true
          word_fonamentacio = word_fonamentacio + llista('Sabates o rases de formigó')
        end 
        if @edifici.fonamentacio.llosa == true
          word_fonamentacio = word_fonamentacio + llista('Llosa de formigó')
        end 
        if @edifici.fonamentacio.pilons == true
          word_fonamentacio = word_fonamentacio + llista('Fonamentació profunda de pilons')
        end 
        if @edifici.fonamentacio.pantalles == true
          word_fonamentacio = word_fonamentacio + llista('Fonamentació profunda de pantalles')
        end 
        doc.replace("$fonamentacio$", word_fonamentacio)

        # Estructura
        word_estructura = ''
        if @edifici.estructura.parets_pedra == true
          word_estructura = word_estructura + llista('Parets de paredat')
        end
        if @edifici.estructura.parets_formigo_armat == true
          word_estructura = word_estructura + llista('Parets de formigó armat')
        end
        if @edifici.estructura.parets_tova == true
          word_estructura = word_estructura + llista('Parets de tova')
        end
        if @edifici.estructura.parets_tapia == true
          word_estructura = word_estructura + llista('Parets de tàpia')
        end
        if @edifici.estructura.parets_fabrica_mao == true
          word_estructura = word_estructura + llista('Parets de fàbrica de maó')
        end
        if @edifici.estructura.parets_bloc_ceramic == true
          word_estructura = word_estructura + llista('Parets de bloc ceràmic')
        end
        if @edifici.estructura.parets_bloc_formigo == true
          word_estructura = word_estructura + llista('Parets de bloc de formigó')
        end
        if @edifici.estructura.parets_entramat_fusta == true
          word_estructura = word_estructura + llista('Parets d\'entramat de fusta')
        end
        if @edifici.estructura.pilars_mao == true
          word_estructura = word_estructura + llista('Pilars de maons')
        end
        if @edifici.estructura.pilars_ferro_colat == true
          word_estructura = word_estructura + llista('Pilars de ferro colat')
        end
        if @edifici.estructura.pilars_acer == true
          word_estructura = word_estructura + llista('Pilars d\'acer')
        end
        if @edifici.estructura.pilars_formigo_armat == true
          word_estructura = word_estructura + llista('Pilars de formigó armat')
        end
        if @edifici.estructura.bigues_fusta == true
          word_estructura = word_estructura + llista('Bigues de fusta')
        end
        if @edifici.estructura.bigues_metaliques == true
          word_estructura = word_estructura + llista('Bigues metàl·liques')
        end
        if @edifici.estructura.bigues_formigo_armat == true
          word_estructura = word_estructura + llista('Bigues de formigó armat')
        end
        if @edifici.estructura.forjat_fusta == true
          word_estructura = word_estructura + llista('Sostre de fusta')
        end
        if @edifici.estructura.forjat_metalic == true
          word_estructura = word_estructura + llista('Sostre metàl·lic')
        end
        if @edifici.estructura.forjat_formigo_armat == true
          word_estructura = word_estructura + llista('Sostre de formigó armat')
        end
        if @edifici.estructura.forjat_ceramica_armada == true
          word_estructura = word_estructura + llista('Sostre de ceràmica armada')
        end
        if @edifici.estructura.entrebigat_taulell == true
          word_estructura = word_estructura + llista('Entrebigat de taulell')
        end
        if @edifici.estructura.entrebigat_revolto_ceramic == true
          word_estructura = word_estructura + llista('Entrebigat de revoltó ceràmic')
        end
        if @edifici.estructura.entrebigat_revolto_formigo == true
          word_estructura = word_estructura + llista('Entrebigat de revoltó de formigó')
        end
        if @edifici.estructura.forjat_reticular == true
          word_estructura = word_estructura + llista('Forjat reticular')
        end
        if @edifici.estructura.llosa_formigo == true
          word_estructura = word_estructura + llista('Llosa de formigó')
        end
        if @edifici.estructura.forjat_sanitari == true
          word_estructura = word_estructura + llista('Forjat sanitari')
        end
        if @edifici.estructura.solera == true
          word_estructura = word_estructura + llista('Solera')
        end
        if @edifici.estructura.forjat_horitzontal_coberta_capa_pendent == true
          word_estructura = word_estructura + llista('Estructura de coberta de sostre horitzontal amb capa de formació de pendents')
        end
        if @edifici.estructura.forjat_horitzontal_coberta_envanets == true
          word_estructura = word_estructura + llista('Estructura de coberta de sostre horitzontal amb envanets i taulell')
        end
        if @edifici.estructura.forjat_inclinat_coberta_formigo == true
          word_estructura = word_estructura + llista('Estructura de coberta de sostre inclinat de formigó armat')
        end
        if @edifici.estructura.encavallada_bigues_formigo == true
          word_estructura = word_estructura + llista('Encavallada de bigues de formigó armat i taulell')
        end
        if @edifici.estructura.encavallada_bigues_metall == true
          word_estructura = word_estructura + llista('Encavallada de bigues metàl·liques i taulell')
        end
        if @edifici.estructura.encavallada_bigues_fusta == true
          word_estructura = word_estructura + llista('Encavallada de bigues de fusta i taulell')
        end
        if @edifici.estructura.coberta_taulell_ceramic == true
          word_estructura = word_estructura + llista('Estructura de coberta de taulell ceràmic')
        end
        if @edifici.estructura.coberta_taulell_fusta == true
          word_estructura = word_estructura + llista('Estructura de coberta de taulell de fusta')
        end
        if @edifici.estructura.coberta_sandwich == true
          word_estructura = word_estructura + llista('Estructura de coberta de xapa o panells sandwich')
        end
        if @edifici.estructura.escala_fusta == true
          word_estructura = word_estructura + llista('Escala de fusta')
        end
        if @edifici.estructura.escala_metall == true
          word_estructura = word_estructura + llista('Escala metàl·lica')
        end
        if @edifici.estructura.escala_ceramica == true
          word_estructura = word_estructura + llista('Escala de volta ceràmica')
        end
        if @edifici.estructura.escala_llosa_armada == true
          word_estructura = word_estructura + llista('Escala de llosa armada')
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
        word_tancaments = ''
        if @edifici.tancaments_vertical.acabat_vist_paredat == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de paredat amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_vist_carreus == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de carreus amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_vist_fabrica_mao == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de fàbrica de maons amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_vist_fabrica_bloc_ceramic == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de bloc ceràmic amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_vist_bloc_formigo == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de bloc de formigó amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_vist_panell_formigo == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de panells de formigó amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_vist_panell_metalic_sandwich == true
          word_tancaments = word_tancaments + llista_tancaments('Parets de panells metàl·lics o de tipus sandwich amb acabat vist')
        end
        if @edifici.tancaments_vertical.acabat_revestit_arrebossat_pintat == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb acabat revestit arrebossat i pintat')
        end
        if @edifici.tancaments_vertical.acabat_revestit_estucat == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb acabat revestit estucat')
        end
        if @edifici.tancaments_vertical.acabat_revestit_morter_monocapa == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb revestiment de morter monocapa')
        end
        if @edifici.tancaments_vertical.acabat_revestit_aplacat_ceramic == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb revestiment d\'aplacat ceràmic')
        end
        if @edifici.tancaments_vertical.acabat_revestit_aplacat_pedra == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb revestiment d\'aplacat de pedra')
        end
        if @edifici.tancaments_vertical.acabat_revestit_xapa_metalica == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb revestiment de xapa metàl·lica')
        end
        if @edifici.tancaments_vertical.acabat_revestit_xapa_metalica == true
          word_tancaments = word_tancaments + llista_tancaments('Parets amb revestiment de xapa metàl·lica')
        end
        if @edifici.tancaments_vertical.fusteria_fusta == true
          word_tancaments = word_tancaments + llista('Fusteries de fusta')
        end
        if @edifici.tancaments_vertical.fusteria_acer == true
          word_tancaments = word_tancaments + llista('Fusteries d\'acer')
        end
        if @edifici.tancaments_vertical.fusteria_alumini == true
          word_tancaments = word_tancaments + llista('Fusteries d\'alumini')
        end
        if @edifici.tancaments_vertical.fusteria_pvc == true
          word_tancaments = word_tancaments + llista('Fusteries de PVC')
        end
        if @edifici.tancaments_vertical.vidre_simple == true
          word_tancaments = word_tancaments + llista('Fusteries amb vidre senzill')
        end
        if @edifici.tancaments_vertical.vidre_doble == true
          word_tancaments = word_tancaments + llista('Fusteries amb vidre doble')
        end
        if @edifici.tancaments_vertical.vidre_triple == true
          word_tancaments = word_tancaments + llista('Fusteries amb vidre triple')
        end
        if @edifici.tancaments_vertical.vidre_baix_emissiu == true
          word_tancaments = word_tancaments + llista('Vidre amb capa baix emissiva')
        end
        if @edifici.tancaments_vertical.vidre_control_solar == true
          word_tancaments = word_tancaments + llista('Vidre amb capa de control solar')
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
        word_coberta = ''
        if @edifici.coberta.terrat_transitable == true
          word_coberta = word_coberta + llista_terrat('Terrat transitable')
        end
        if @edifici.coberta.terrat_no_transitable == true
          word_coberta = word_coberta + llista_terrat('Terrat no transitable')
        end
        if @edifici.coberta.coberta_teula_arab == true
          word_coberta = word_coberta + llista_terrat('Coberta de teula àrab')
        end
        if @edifici.coberta.coberta_teula_plana == true
          word_coberta = word_coberta + llista_terrat('Coberta de teula plana')
        end
        if @edifici.coberta.coberta_teula_ciment == true
          word_coberta = word_coberta + llista_terrat('Coberta de teula de ciment')
        end
        if @edifici.coberta.coberta_pissarra == true
          word_coberta = word_coberta + llista_terrat('Coberta de pissarra')
        end
        if @edifici.coberta.coberta_fibrociment == true
          word_coberta = word_coberta + llista_terrat('Coberta de fibrociment')
        end
        if @edifici.coberta.coberta_asfaltica == true
          word_coberta = word_coberta + llista_terrat('Coberta de làmina asfàltica')
        end
        if @edifici.coberta.coberta_xapa_acer == true
          word_coberta = word_coberta + llista_terrat('Coberta de xapa d\'acer')
        end
        if @edifici.coberta.coberta_xapa_coure == true
          word_coberta = word_coberta + llista_terrat('Coberta de xapa de coure')
        end
        if @edifici.coberta.coberta_aillament_termic == true
          word_coberta = word_coberta + llista_terrat('Coberta amb aïllament tèrmic')
        end
        doc.replace("$coberta$", word_coberta)

        # Sanejament
        word_sanejament = ''
        if @edifici.sanejament.no_sistema_evacuacio == true
          word_sanejament = word_sanejament + llista('No disposa de sistema d\'evacuació')
        end
        if @edifici.sanejament.si_sistema_evacuacio == true && @edifici.sanejament.fosa_septica == false
          word_sanejament = word_sanejament + llista('Disposa de sistema d\'evacuació')
        end
        if @edifici.sanejament.fosa_septica == true
          word_sanejament = word_sanejament + llista('Sistema d\'evacuació propi (fossa sèptica, etc.)')
        end
        if @edifici.sanejament.bomba_elevacio == true
          word_sanejament = word_sanejament + llista('Bomba d\'elevació')
        end
        if @edifici.sanejament.separador_greixos == true
          word_sanejament = word_sanejament + llista('Separador de greixos i fangs')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_ceramics == true
          word_sanejament = word_sanejament + llista('Baixants vistos ceràmics')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_pvc == true
          word_sanejament = word_sanejament + llista('Baixants vistos de PVC')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_fibrociment == true
          word_sanejament = word_sanejament + llista('Baixants vistos de fibrociment')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_coure == true
          word_sanejament = word_sanejament + llista('Baixants vistos de coure')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_alumini == true
          word_sanejament = word_sanejament + llista('Baixants vistos d\'alumini')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_polipropile == true
          word_sanejament = word_sanejament + llista('Baixants vistos de polipropilè')
        end
        if @edifici.sanejament.baixants_vistos == true && @edifici.sanejament.baixants_zinc == true
          word_sanejament = word_sanejament + llista('Baixants vistos de zinc')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_ceramics == true
          word_sanejament = word_sanejament + llista('Baixants encastats ceràmics')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_pvc == true
          word_sanejament = word_sanejament + llista('Baixants encastats de PVC')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_fibrociment == true
          word_sanejament = word_sanejament + llista('Baixants encastats de fibrociment')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_coure == true
          word_sanejament = word_sanejament + llista('Baixants encastats de coure')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_alumini == true
          word_sanejament = word_sanejament + llista('Baixants encastats d\'alumini')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_polipropile == true
          word_sanejament = word_sanejament + llista('Baixants encastats de polipropilè')
        end
        if @edifici.sanejament.baixants_encastats == true && @edifici.sanejament.baixants_zinc == true
          word_sanejament = word_sanejament + llista('Baixants encastats de zinc')
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_formigo == true
          word_sanejament = word_sanejament + llista('Col·lectors vistos de formigó')
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_ceramic == true
          word_sanejament = word_sanejament + llista('Col·lectors vistos ceràmics')
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_fibrociment == true
          word_sanejament = word_sanejament + llista('Col·lectors vistos de fibrociment')
        end
        if @edifici.sanejament.colectors_vistos == true && @edifici.sanejament.colectors_pvc == true
          word_sanejament = word_sanejament + llista('Col·lectors vistos de PVC')
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_formigo == true
          word_sanejament = word_sanejament + llista('Col·lectors soterrats de formigó')
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_ceramic == true
          word_sanejament = word_sanejament + llista('Col·lectors soterrats ceràmics')
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_fibrociment == true
          word_sanejament = word_sanejament + llista('Col·lectors soterrats de fibrociment')
        end
        if @edifici.sanejament.colectors_soterrats == true && @edifici.sanejament.colectors_pvc == true
          word_sanejament = word_sanejament + llista('Col·lectors soterrats de PVC')
        end
        doc.replace("$sanejament$", word_sanejament)

        # Aigua
        word_aigua = ''
        if @edifici.aigua.connexio_directa == true
          word_aigua = word_aigua + llista('Disposa de connexió directa a xarxa pública de subministrament d\'aigua')
        end
        if @edifici.aigua.connexio_aforament == true
          word_aigua = word_aigua + llista('Disposa de connexió per aforament a xarxa pública de subministrament d\'aigua')
        end
        if @edifici.aigua.captacio_propia == true
          word_aigua = word_aigua + llista('Disposa de captació pròpia (pou, bomba, etc.)')
        end
        if @edifici.aigua.grup_pressio == true
          word_aigua = word_aigua + llista('Disposa de grup de pressió')
        end
        if @edifici.aigua.comptador_unic == true
          word_aigua = word_aigua + llista('Comptador únic per tot l\'edifici')
        end
        if @edifici.aigua.comptadors_individuals_habitatge == true
          word_aigua = word_aigua + llista('Comptadors individuals per habitatge/local')
        end
        if @edifici.aigua.comptadors_individuals_centralitzats == true
          word_aigua = word_aigua + llista('Comptadors individuals centralitzats')
        end
        if @edifici.aigua.muntants_plom == true
          word_aigua = word_aigua + llista('Muntants de plom')
        end
        if @edifici.aigua.muntants_ferro == true
          word_aigua = word_aigua + llista('Muntants de ferro')
        end
        if @edifici.aigua.muntants_coure == true
          word_aigua = word_aigua + llista('Muntants de coure')
        end
        if @edifici.aigua.muntants_plastic == true
          word_aigua = word_aigua + llista('Muntants de plàstic')
        end
        doc.replace("$subministrament_aigua$", word_aigua)

        # Electricitat
        word_electricitat = ''
        if @edifici.electricitat.enllumenat_comunitari == true
          word_electricitat = word_electricitat + llista('Disposa d\'enllumenat comunitari')
        end
        if @edifici.electricitat.connexio_terra == true
          word_electricitat = word_electricitat + llista('Disposa de connexió a terra')
        end
        if @edifici.electricitat.centre_transformacio == true
          word_electricitat = word_electricitat + llista('Hi ha un centre de transformació a l\'edifici')
        end
        if @edifici.electricitat.fotovoltaica == true
          word_electricitat = word_electricitat + llista('Disposa d\'instal·lació solar fotovoltaica')
        end
        if @edifici.electricitat.comptador_unic == true
          word_electricitat = word_electricitat + llista('Comptador únic per tot l\'edifici')
        end
        if @edifici.electricitat.comptadors_individuals_habitatge == true
          word_electricitat = word_electricitat + llista('Comptadors individuals per habitatge/local')
        end
        if @edifici.electricitat.comptadors_centralitzats == true
          word_electricitat = word_electricitat + llista('Comptadors centralitzats')
        end
        doc.replace("$instalacio_electrica$", word_electricitat)

        # Gas
        word_gas = ''
        if @edifici.ga.instalacio_gas == true
          word_gas = word_gas + llista('Escomesa a xarxa de distribució canalitzada de gas per a ús domèstic')
        end
        if @edifici.ga.diposit_aire_lliure == true
          word_gas = word_gas + llista('Dipòsit de gas propà a l\'aire lliure')
        end
        if @edifici.ga.diposit_enterrat == true
          word_gas = word_gas + llista('Dipòsit de gas propà enterrat')
        end
        doc.replace("$instalacio_gas$", word_gas)

        # Climatitzacio
        word_climatitzacio = ''
        if @edifici.climatitzacio.escalfador_pn_menor_24 == true
          word_climatitzacio = word_climatitzacio + llista('Escalfador d\'aigua calenta sanitària (Pn ≤ 24,4 kW)')
        end
        if @edifici.climatitzacio.escalfador_pn_24_70 == true
          word_climatitzacio = word_climatitzacio + llista('Escalfador d\'aigua calenta sanitària (24,4 kW < Pn ≤ 70 kW)')
        end
        if @edifici.climatitzacio.escalfador_pn_major_70 == true
          word_climatitzacio = word_climatitzacio + llista('Escalfador d\'aigua calenta sanitària (Pn > 70 kW)')
        end
        if @edifici.climatitzacio.caldera_gas_pn_menor_70 == true
          word_climatitzacio = word_climatitzacio + llista('Caldera a gas (Pn ≤ 70 kW)')
        end
        if @edifici.climatitzacio.caldera_gas_pn_major_70 == true
          word_climatitzacio = word_climatitzacio + llista('Caldera a gas (Pn > 70 kW)')
        end
        if @edifici.climatitzacio.caldera_biomassa == true
          word_climatitzacio = word_climatitzacio + llista('Caldera a biomassa')
        end
        if @edifici.climatitzacio.caldera_solar_termica == true
          word_climatitzacio = word_climatitzacio + llista('Caldera amb instal·lació d’energia solar tèrmica')
        end
        if @edifici.climatitzacio.altres_pn_menor_70 == true
          word_climatitzacio = word_climatitzacio + llista('Caldera (Pn ≤ 70 kW)')
        end
        if @edifici.climatitzacio.altres_pn_major_70 == true
          word_climatitzacio = word_climatitzacio + llista('Caldera (Pn > 70 kW)')
        end
        if @edifici.climatitzacio.clima_pn_menor_12_autonoms == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb equips autònoms (Pn ≤ 12 kW)')
        end
        if @edifici.climatitzacio.clima_pn_menor_12_torres == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb torre de refrigeració (Pn ≤ 12 kW)')
        end
        if @edifici.climatitzacio.clima_pn_menor_12_recuperador == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb recuperador de calor (Pn ≤ 12 kW)')
        end
        if @edifici.climatitzacio.clima_pn_12_70_autonoms == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb equips autònoms (12 kW < Pn ≤ 70 kW)')
        end
        if @edifici.climatitzacio.clima_pn_12_70_torres == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb torre de refrigeració (12 kW < Pn ≤ 70 kW)')
        end
        if @edifici.climatitzacio.clima_pn_12_70_recuperador == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb recuperador de calor (12 kW < Pn ≤ 70 kW)')
        end
        if @edifici.climatitzacio.clima_pn_major_70_autonoms == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb equips autònoms (Pn > 70 kW)')
        end
        if @edifici.climatitzacio.clima_pn_major_70_torres == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb torre de refrigeració (Pn > 70 kW)')
        end
        if @edifici.climatitzacio.clima_pn_major_70_recuperador == true
          word_climatitzacio = word_climatitzacio + llista('Sistema de climatització amb recuperador de calor (Pn > 70 kW)')
        end
        doc.replace("$climatitzacio$", word_climatitzacio)

        # Ventilació
        word_ventilacio = ''
        if @edifici.ventilacio.habitatge_natural_conductes == true
          word_ventilacio = word_ventilacio + llista('Natural per conductes en habitatge')
        end
        if @edifici.ventilacio.habitatge_natural_obertures == true
          word_ventilacio = word_ventilacio + llista('Natural per obertures en habitatge')
        end
        if @edifici.ventilacio.habitatge_mecanica_conductes == true
          word_ventilacio = word_ventilacio + llista('Mecànica per conductes en habitatge')
        end
        if @edifici.ventilacio.habitatge_mecanica_obertures == true
          word_ventilacio = word_ventilacio + llista('Mecànica per obertures en habitatge')
        end
        if @edifici.ventilacio.habitatge_mecanica_control == true
          word_ventilacio = word_ventilacio + llista('Sistema de control de la ventilació en habitatge')
        end
        if @edifici.ventilacio.traster_natural_conductes == true
          word_ventilacio = word_ventilacio + llista('Natural per conductes en traster')
        end
        if @edifici.ventilacio.traster_natural_obertures == true
          word_ventilacio = word_ventilacio + llista('Natural per obertures en traster')
        end
        if @edifici.ventilacio.traster_mecanica_conductes == true
          word_ventilacio = word_ventilacio + llista('Mecànica per conductes en traster')
        end
        if @edifici.ventilacio.traster_mecanica_obertures == true
          word_ventilacio = word_ventilacio + llista('Mecànica per obertures en traster')
        end
        if @edifici.ventilacio.traster_mecanica_control == true
          word_ventilacio = word_ventilacio + llista('Sistema de control de la ventilació en traster')
        end
        if @edifici.ventilacio.magatzem_natural_conductes == true
          word_ventilacio = word_ventilacio + llista('Natural per conductes en magatzem')
        end
        if @edifici.ventilacio.magatzem_natural_obertures == true
          word_ventilacio = word_ventilacio + llista('Natural per obertures en magatzem')
        end
        if @edifici.ventilacio.magatzem_mecanica_conductes == true
          word_ventilacio = word_ventilacio + llista('Mecànica per conductes en magatzem')
        end
        if @edifici.ventilacio.magatzem_mecanica_obertures == true
          word_ventilacio = word_ventilacio + llista('Mecànica per obertures en magatzem')
        end
        if @edifici.ventilacio.magatzem_mecanica_control == true
          word_ventilacio = word_ventilacio + llista('Sistema de control de la ventilació en magatzem')
        end
        if @edifici.ventilacio.garatge_natural_conductes == true
          word_ventilacio = word_ventilacio + llista('Natural per conductes en garatge')
        end
        if @edifici.ventilacio.garatge_natural_obertures == true
          word_ventilacio = word_ventilacio + llista('Natural per obertures en garatge')
        end
        if @edifici.ventilacio.garatge_mecanica_conductes == true
          word_ventilacio = word_ventilacio + llista('Mecànica per conductes en garatge')
        end
        if @edifici.ventilacio.garatge_mecanica_obertures == true
          word_ventilacio = word_ventilacio + llista('Mecànica per obertures en garatge')
        end
        if @edifici.ventilacio.garatge_mecanica_control == true
          word_ventilacio = word_ventilacio + llista('Sistema de control de la ventilació en garatge')
        end
        doc.replace("$ventilacio$", word_ventilacio)

        # Protecció contra incendis
        word_incendis = ''
        if @edifici.incendi.alarma_automatica == true
          word_incendis = word_incendis + llista('Sistema automàtic de detecció i alarma d\'incendis')
        end
        if @edifici.incendi.alarma_manual == true
          word_incendis = word_incendis + llista('Sistema manual d\'alarma d\'incendis')
        end
        if @edifici.incendi.extintors == true
          word_incendis = word_incendis + llista('Extintors d\'incendis')
        end
        if @edifici.incendi.abastiment_aigua == true
          word_incendis = word_incendis + llista('Sistema d\'abastiment d\'aigua contra incendis')
        end
        if @edifici.incendi.bie == true
          word_incendis = word_incendis + llista('Boca d\'incendis equipada (BIE)')
        end
        if @edifici.incendi.hidrants == true
          word_incendis = word_incendis + llista('Hidrants')
        end
        if @edifici.incendi.ruixadors == true
          word_incendis = word_incendis + llista('Sistemes fixes d’extinció (ruixadors)')
        end
        if @edifici.incendi.columnes_seques == true
          word_incendis = word_incendis + llista('Columnes seques')
        end
        if @edifici.incendi.parallamps == true
          word_incendis = word_incendis + llista('Parallamps')
        end
        doc.replace("$incendis$", word_incendis)

        # Ascensor
        word_ascensor = ''
        if @edifici.ascensor.habitatge_unifamiliar == true || @edifici.ascensor.edifici_comunitari == true || @edifici.ascensor.mes_20_plantes == true || @edifici.ascensor.altres == true
          word_ascensor = word_ascensor + llista('L\'edifici disposa d\'ascensor')
        end
        doc.replace("$ascensors$", word_ascensor)

        # Telecomunicacions
        word_telecomunicacions = ''
        if @edifici.telecomunicacio.porter_audio == true
          word_telecomunicacions = word_telecomunicacions + llista('Porter electrònic amb sistema d\'àudio')
        end
        if @edifici.telecomunicacio.porter_video == true
          word_telecomunicacions = word_telecomunicacions + llista('Porter electrònic amb sistema d\'àudio i vídeo')
        end
        if @edifici.telecomunicacio.antena_individual == true
          word_telecomunicacions = word_telecomunicacions + llista('Antena individual i xarxa coaxial')
        end
        if @edifici.telecomunicacio.antena_colectiva == true
          word_telecomunicacions = word_telecomunicacions + llista('Antena col·lectiva i xarxa coaxial')
        end
        if @edifici.telecomunicacio.parabolica_individual == true
          word_telecomunicacions = word_telecomunicacions + llista('Antena parabòlica individual')
        end
        if @edifici.telecomunicacio.parabolica_colectiva == true
          word_telecomunicacions = word_telecomunicacions + llista('Antena parabòlica col·lectiva')
        end
        if @edifici.telecomunicacio.telefonia == true
          word_telecomunicacions = word_telecomunicacions + llista('Instal·lació de telefonia')
        end
        if @edifici.telecomunicacio.riti == true
          word_telecomunicacions = word_telecomunicacions + llista('RITI (Recinte d’instal·lacions de telecomunicacions inferior)')
        end
        if @edifici.telecomunicacio.rits == true
          word_telecomunicacions = word_telecomunicacions + llista('RITS (Recinte d’instal·lacions de telecomunicacions superior)')
        end
        if @edifici.telecomunicacio.ritu == true
          word_telecomunicacions = word_telecomunicacions + llista('RITU (Recinte d’instal·lacions de telecomunicacions únic)')
        end
        if @edifici.telecomunicacio.ritm == true
          word_telecomunicacions = word_telecomunicacions + llista('RITM (Recinte d’instal·lacions de telecomunicacions únic modular prefabricat)')
        end
        doc.replace("$telecomunicacions$", word_telecomunicacions)

        # Especials
        word_especials = ''
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
          word_especials = word_especials + llista(text_piscina)
        end
        if @edifici.especial.piscina_climatitzacio == true 
          word_especials = word_especials + llista('La piscina disposa d\'instal·lació de climatització')
        end
        if @edifici.especial.piscina_iluminacio == true 
          word_especials = word_especials + llista('La piscina disposa d\'instal·lació d\'il·luminació submergida')
        end
        if @edifici.especial.piscina_purificador == true 
          word_especials = word_especials + llista('La piscina disposa d\'instal·lació de purificació d\'aigües')
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
        referencies_tancaments_verticals = @referencies.where(:sistema => 'tancaments_verticals').pluck(:operacio_id)
        operacions_tancaments_verticals = Operacio.find(referencies_tancaments_verticals)
        word_operacions_tancaments_verticals = ''
        operacions_tancaments_verticals.each do |operacio|
          word_operacions_tancaments_verticals = word_operacions_tancaments_verticals + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_tancaments_verticals$", word_operacions_tancaments_verticals)

        # Coberta
        referencies_coberta = @referencies.where(:sistema => 'coberta').pluck(:operacio_id)
        operacions_coberta = Operacio.find(referencies_coberta)
        word_operacions_coberta = ''
        operacions_coberta.each do |operacio|
          word_operacions_coberta = word_operacions_coberta + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_cobertes$", word_operacions_coberta)

        # Sanejament
        referencies_sanejament = @referencies.where(:sistema => 'sanejament').pluck(:operacio_id)
        operacions_sanejament = Operacio.find(referencies_sanejament)
        word_operacions_sanejament = ''
        operacions_sanejament.each do |operacio|
          word_operacions_sanejament = word_operacions_sanejament + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_sanejament$", word_operacions_sanejament)

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
        referencies_ascensors = @referencies.where(:sistema => 'ascensors').pluck(:operacio_id)
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

  def document_quadern
    @operacions = Operacio.all
    @text_operacions = ''
    @operacions.each do |operacio|
      @text_operacions = @text_operacions.to_s + '<w:p><w:r><w:t>' + operacio.descripcio_ca.to_s + '</w:t></w:r></w:p><w:p/>' 
    end
    respond_to do |format|
      format.docx do
        # Initialize DocxReplace with your template
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/quadern_template.docx", "#{Rails.root}/tmp")

        # Replace some variables. $var$ convention is used here, but not required.
        doc.replace("$nom_edifici$", @edifici.nom_edifici)
        doc.replace("$operacions$", @text_operacions)
        #doc.replace("$altres_operacions$", )

        # Write the document back to a temporary file
        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        # Respond to the request by sending the temp file
        send_file tmp_file.path, filename: "edifici_#{@edifici.nom_edifici}_quadern.docx", disposition: 'attachment'
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
        doc.replace("$operacions_estructura$", word_operacions_estructura)

        # Tancaments
        referencies_tancaments = @referencies_manual.where(:sistema => 'tancaments', :manual_habitatge => true).pluck(:operacio_id)
        operacions_tancaments = Operacio.find(referencies_tancaments)
        word_operacions_tancaments = ''
        operacions_tancaments.each do |operacio|
          word_operacions_tancaments = word_operacions_tancaments + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_tancaments$", word_operacions_tancaments)

        # Terrats
        referencies_terrats = @referencies_manual.where(:sistema => 'cobertes', :manual_habitatge => true).pluck(:operacio_id)
        operacions_terrats = Operacio.find(referencies_terrats)
        word_operacions_terrats = ''
        operacions_terrats.each do |operacio|
          word_operacions_terrats = word_operacions_terrats + taula_operacio(operacio.descripcio_ca, operacio.periodicitat_text_ca, operacio.responsable_ca)
        end
        doc.replace("$operacions_terrats$", word_operacions_terrats)

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
        doc.replace("$us_edifici$", @edifici.identificacio.us_edifici)
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
