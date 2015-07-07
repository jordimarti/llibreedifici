class DocumentsController < ApplicationController
  before_action :set_edifici
  layout 'edifici'

  def index
    @submenu_actiu = 'documents'
  end

  def quadern
    @menu_documents_actiu = 'quadern'
  end

  def nou_plurifamiliar
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/nou_plurifamiliar4.docx", "#{Rails.root}/tmp")
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
        # Promotor
        word_promotor = ''
        if @edifici.promotors.count > 0
          @edifici.promotors.each do |promotor|
            word_promotor = word_promotor + '<w:p w14:paraId="257B8550" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr></w:pPr><w:r w:rsidRPr="000A307D"><w:rPr><w:b/><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t>Promotor</w:t></w:r></w:p><w:p w14:paraId="0EB61AB8" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="000A307D"><w:pPr><w:rPr><w:b/><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr></w:pPr></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:type="auto" w:w="0"/><w:tblBorders><w:top w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:left w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:bottom w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:right w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideH w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideV w:color="auto" w:space="0" w:sz="0" w:val="none"/></w:tblBorders><w:tblLook w:firstColumn="1" w:firstRow="1" w:lastColumn="0" w:lastRow="0" w:noHBand="0" w:noVBand="1" w:val="04A0"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w14:paraId="2F46F438" w14:textId="77777777" w:rsidR="000156E3" w:rsidTr="002604D8"><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="7B2BB159" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Nom:</w:t></w:r></w:p><w:p w14:paraId="563F9F7D" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="007B75EB"><w:r><w:t>' + promotor.nom_promotor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="61D65780" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>NIF/CIF:</w:t></w:r></w:p><w:p w14:paraId="76E7A236" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="007B75EB"><w:r><w:t>' + promotor.nif_promotor + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="5013D2E6" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:pBdr><w:bottom w:color="auto" w:space="1" w:sz="6" w:val="single"/></w:pBdr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="238E9121" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:type="auto" w:w="0"/><w:tblLook w:firstColumn="1" w:firstRow="1" w:lastColumn="0" w:lastRow="0" w:noHBand="0" w:noVBand="1" w:val="04A0"/></w:tblPr><w:tblGrid><w:gridCol w:w="8638"/></w:tblGrid><w:tr w14:paraId="7DC540CA" w14:textId="77777777" w:rsidR="000156E3" w:rsidTr="002604D8"><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="8638"/><w:tcBorders><w:top w:val="nil"/><w:left w:val="nil"/><w:bottom w:val="nil"/><w:right w:val="nil"/></w:tcBorders></w:tcPr><w:p w14:paraId="2F627515" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Adreça:</w:t></w:r></w:p><w:p w14:paraId="6F327527" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:t>' + promotor.adreca_promotor + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="13538DAE" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:pBdr><w:bottom w:color="auto" w:space="1" w:sz="6" w:val="single"/></w:pBdr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="076F0F47" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="007B75EB"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:type="auto" w:w="0"/><w:tblBorders><w:top w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:left w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:bottom w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:right w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideH w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideV w:color="auto" w:space="0" w:sz="0" w:val="none"/></w:tblBorders><w:tblLook w:firstColumn="1" w:firstRow="1" w:lastColumn="0" w:lastRow="0" w:noHBand="0" w:noVBand="1" w:val="04A0"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w14:paraId="0F9A477C" w14:textId="77777777" w:rsidR="000156E3" w:rsidTr="002604D8"><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="4AA9B9B6" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Codi postal:</w:t></w:r></w:p><w:p w14:paraId="6C464751" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="000A307D"><w:r><w:t>' + promotor.cp_promotor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="5F2AE436" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Població:</w:t></w:r></w:p><w:p w14:paraId="0B81DA24" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="000A307D"><w:r><w:t>' + promotor.poblacio_promotor + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="2CB52090" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:pBdr><w:bottom w:color="auto" w:space="1" w:sz="6" w:val="single"/></w:pBdr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="3BAEF6D9" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="007B75EB"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:tbl><w:tblPr><w:tblStyle w:val="Tablaconcuadrcula"/><w:tblW w:type="auto" w:w="0"/><w:tblBorders><w:top w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:left w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:bottom w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:right w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideH w:color="auto" w:space="0" w:sz="0" w:val="none"/><w:insideV w:color="auto" w:space="0" w:sz="0" w:val="none"/></w:tblBorders><w:tblLook w:firstColumn="1" w:firstRow="1" w:lastColumn="0" w:lastRow="0" w:noHBand="0" w:noVBand="1" w:val="04A0"/></w:tblPr><w:tblGrid><w:gridCol w:w="4319"/><w:gridCol w:w="4319"/></w:tblGrid><w:tr w14:paraId="3E176B35" w14:textId="77777777" w:rsidR="000156E3" w:rsidTr="002604D8"><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="4240C80F" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>Província:</w:t></w:r></w:p><w:p w14:paraId="4A47D080" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="000A307D"><w:r><w:t>' + promotor.provincia_promotor + '</w:t></w:r></w:p></w:tc><w:tc><w:tcPr><w:tcW w:type="dxa" w:w="4319"/></w:tcPr><w:p w14:paraId="40168B4D" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr><w:r><w:rPr><w:b/></w:rPr><w:t>País:</w:t></w:r></w:p><w:p w14:paraId="3BEAE9C8" w14:textId="77777777" w:rsidP="002604D8" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="000A307D"><w:r><w:t>' + promotor.pais_promotor + '</w:t></w:r></w:p></w:tc></w:tr></w:tbl><w:p w14:paraId="2378AA05" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3"><w:pPr><w:pBdr><w:bottom w:color="auto" w:space="1" w:sz="6" w:val="single"/></w:pBdr><w:rPr><w:b/></w:rPr></w:pPr></w:p><w:p w14:paraId="671F4C85" w14:textId="77777777" w:rsidP="000156E3" w:rsidR="000156E3" w:rsidRDefault="000156E3" w:rsidRPr="007B75EB"><w:pPr><w:rPr><w:b/></w:rPr></w:pPr></w:p>'
          end
        end
        doc.replace("$promotor$", word_promotor)

        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "edifici_#{@edifici.nom_edifici}.docx", disposition: 'attachment'
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
