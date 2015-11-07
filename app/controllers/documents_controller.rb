class DocumentsController < ApplicationController
  before_action :set_edifici
  include Docmosis
  include DocxGenerator
  layout 'edifici', :only => :index
  layout 'pdf', only: [:vista_pdf_edifici_nou, :doc_pdf]

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

  def doc_pdf
    kit = PDFKit.new('http://localhost:3000/edificis/1/documents/vista_pdf_edifici_nou?locale=ca')

    #tmp_file = Tempfile.new('pdf_template', "#{Rails.root}/tmp")
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')

    send_file file, filename: "document.pdf", disposition: 'attachment'
  end

  def vista_pdf_edifici_nou

  end

  def manual_manteniment
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/manual_manteniment.docx", "#{Rails.root}/tmp")
        
        doc.replace("$text_manteniment$", text_manual_manteniment)

        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "manual_manteniment.docx", disposition: 'attachment'
      end
    end
  end

  def calendari_manteniment
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/calendari.docx", "#{Rails.root}/tmp")
        doc.replace("$calendari$", calendari)
        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "calendari_manteniment.docx", disposition: 'attachment'
      end
    end
  end

  def llibre_nou
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/nou.docx", "#{Rails.root}/tmp")
        if @edifici.identificacio.bloc_edifici.blank?
          adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s
        else
          adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ', bloc ' + @edifici.identificacio.bloc_edifici.to_s
        end
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
        doc.replace("$word_agents$", text_agents)
        doc.replace("$word_dades$", text_dades)
        doc.replace("$word_manual_manteniment$", text_manual_manteniment)
        doc.replace("$titol_apartat_arxiu$", arxiu_documents_edifici_nou)
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
        if @edifici.identificacio.bloc_edifici.blank?
          adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s
        else
          adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ', bloc ' + @edifici.identificacio.bloc_edifici.to_s
        end
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
        doc.replace("$word_manual_habitatge$", text_manual_habitatge)
        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "manual_habitatge_#{@edifici.nom_edifici}.docx", disposition: 'attachment'
      end
    end
  end

  def llibre_existent
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/existents.docx", "#{Rails.root}/tmp")
        if @edifici.identificacio.bloc_edifici.blank?
          adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s
        else
          adreca = @edifici.identificacio.tipus_via_edifici.to_s + ' ' + @edifici.identificacio.via_edifici.to_s + ' ' + @edifici.identificacio.numero_edifici.to_s + ', bloc ' + @edifici.identificacio.bloc_edifici.to_s
        end
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
        doc.replace("$word_agents$", text_agents)
        doc.replace("$word_dades$", text_dades)
        doc.replace("$word_manual_manteniment$", text_manual_manteniment)
        doc.replace("$titol_apartat_arxiu$", arxiu_documents_edifici_existent)
        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "#{@edifici.nom_edifici}.docx", disposition: 'attachment'
      end
    end
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
end
