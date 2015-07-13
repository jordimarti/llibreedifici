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
