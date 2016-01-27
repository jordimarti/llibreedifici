class DocumentsController < ApplicationController
  before_action :set_edifici
  include DocxGenerator
  include PdfGenerator
  layout 'edifici'
  #layout 'pdf', only: [:vista_pdf_edifici_nou, :doc_pdf]

  def index
    @submenu_actiu = 'documents'
  end

  def llibre_nou_pdf
    url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_edifici_nou?locale=ca'
    url_header = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_header?locale=ca'
    url_footer = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_footer?locale=ca'
    kit = PDFKit.new(url_edifici, :header_html => url_header, :footer_html => url_footer)
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')
    send_file file, filename: "#{@edifici.nom_edifici}.pdf", disposition: 'attachment'
  end

  def manual_habitatge_pdf
    url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_manual_habitatge?locale=ca'
    kit = PDFKit.new(url_edifici)
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')
    send_file file, filename: "#{@edifici.nom_edifici}_manual_habitatge.pdf", disposition: 'attachment'
  end

  def llibre_existent_pdf
    url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_edifici_existent?locale=ca'
    kit = PDFKit.new(url_edifici)
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')
    send_file file, filename: "#{@edifici.nom_edifici}.pdf", disposition: 'attachment'
  end

  def vista_pdf_edifici_nou
    @text_manual_manteniment = text_manteniment_pdf.html_safe
    @titols_arxiu = espdf_arxiu_documents_edifici_nou.html_safe
    render :layout => 'pdf'
  end

  def vista_pdf_manual_habitatge
    @text_manual_manteniment = text_manual_habitatge_pdf.html_safe
    render :layout => 'pdf'
  end

  def vista_pdf_edifici_existent
    @text_manual_manteniment = text_manteniment_pdf.html_safe
    @titols_arxiu = espdf_arxiu_documents_edifici_existent.html_safe
    render :layout => 'pdf'
  end

  def vista_pdf_header
    render :layout => false
  end

  def vista_pdf_footer
    render :layout => false
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
        doc.replace("$observacions$", @edifici.identificacio.observacions)
        doc.replace("$word_agents$", text_agents)
        doc.replace("$word_dades$", text_dades)
        doc.replace("$word_manual_manteniment$", text_manual_manteniment)
        doc.replace("$titols_arxiu_documents$", esword_arxiu_documents_edifici_nou)
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
        doc.replace("$any_fi_construccio$", @edifici.identificacio.any_fi_construccio)
        doc.replace("$origen_any_construccio$", @edifici.identificacio.origen_any_construccio)
        doc.replace("$observacions$", @edifici.identificacio.observacions)
        doc.replace("$word_agents$", text_agents)
        doc.replace("$word_dades$", text_dades)
        doc.replace("$word_manual_manteniment$", text_manual_manteniment)
        doc.replace("$titol_apartat_arxiu$", esword_arxiu_documents_edifici_existent)
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
