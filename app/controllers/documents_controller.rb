class DocumentsController < ApplicationController
  before_action :set_edifici
  include DocxGenerator
  include PdfGenerator
  include PdfGeneratorEs
  layout 'edifici'
  #layout 'pdf', only: [:vista_pdf_edifici_nou, :doc_pdf]

  def index
    @submenu_actiu = 'documents'
  end

  def llibre_nou_pdf
    if params[:locale] == 'ca'
      url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_edifici_nou?locale=ca'
    elsif params[:locale] == 'es'
      url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_edifici_nou_es?locale=es'
    end
    url_header = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_header?locale=ca'
    url_footer = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_footer?locale=ca'
    kit = PDFKit.new(url_edifici, :header_html => url_header, :footer_html => url_footer, :header_spacing => 5, :footer_spacing => 5, :margin_top => '1.0in', :margin_bottom => '1.3in')
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')
    send_file file, filename: "#{@edifici.nom_edifici}.pdf", disposition: 'attachment'
  end

  def manual_habitatge_pdf
    if params[:locale] == 'ca'
      url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_manual_habitatge?locale=ca'
    elsif params[:locale] == 'es'
      url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_manual_habitatge_es?locale=es'
    end
    url_header = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_header?locale=ca'
    url_footer = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_footer?locale=ca'
    kit = PDFKit.new(url_edifici, :header_html => url_header, :footer_html => url_footer, :header_spacing => 5, :footer_spacing => 5, :margin_top => '1.0in', :margin_bottom => '1.3in')
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')
    send_file file, filename: "#{@edifici.nom_edifici}_manual_habitatge.pdf", disposition: 'attachment'
  end

  def llibre_existent_pdf
    if params[:locale] == 'ca'
      url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_edifici_existent?locale=ca'
    elsif params[:locale] == 'es'
      url_edifici = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_edifici_existent_es?locale=es'
    end
    url_header = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_header?locale=ca'
    url_footer = 'http://llibreedifici.herokuapp.com/edificis/' + @edifici.id.to_s + '/documents/vista_pdf_footer?locale=ca'
    kit = PDFKit.new(url_edifici, :header_html => url_header, :footer_html => url_footer, :header_spacing => 5, :footer_spacing => 5, :margin_top => '1.0in', :margin_bottom => '1.3in')
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')
    send_file file, filename: "#{@edifici.nom_edifici}.pdf", disposition: 'attachment'
  end

  def vista_pdf_edifici_nou
    @text_manual_manteniment = text_manteniment_pdf.html_safe
    @titols_arxiu = espdf_arxiu_documents_edifici_nou.html_safe
    render :layout => 'pdf'
  end

  # Castellà
  def vista_pdf_edifici_nou_es
    @text_manual_manteniment = text_manteniment_pdf_es.html_safe
    @titols_arxiu = espdf_arxiu_documents_edifici_nou_es.html_safe
    render :layout => 'pdf'
  end

  def vista_pdf_manual_habitatge
    @text_manual_manteniment = text_manual_habitatge_pdf.html_safe
    render :layout => 'pdf'
  end

  # Castellà
  def vista_pdf_manual_habitatge_es
    @text_manual_manteniment = text_manual_habitatge_pdf_es.html_safe
    render :layout => 'pdf'
  end

  def vista_pdf_edifici_existent
    # Comprovem si hi ha agents
    @agents = hi_ha_agents()
    @text_manual_manteniment = text_manteniment_pdf.html_safe
    @titols_arxiu = espdf_arxiu_documents_edifici_existent.html_safe
    render :layout => 'pdf'
  end

  #Castellà
  def vista_pdf_edifici_existent_es
    # Comprovem si hi ha agents
    @agents = hi_ha_agents()
    @text_manual_manteniment = text_manteniment_pdf_es.html_safe
    @titols_arxiu = espdf_arxiu_documents_edifici_existent_es.html_safe
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
        if params[:locale] == 'ca'
          doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/calendari.docx", "#{Rails.root}/tmp")
        elsif params[:locale] == 'es'
          doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/calendari_es.docx", "#{Rails.root}/tmp")
        end
        doc.replace("$calendari$", calendari)
        tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
        doc.commit(tmp_file.path)

        send_file tmp_file.path, filename: "calendari_manteniment.docx", disposition: 'attachment'
      end
    end
  end

  def hi_ha_agents
    if @edifici.promotors.count == 0 && @edifici.projectistes.count == 0 && @edifici.colaboradors.count == 0 && @edifici.constructors.count == 0 && @edifici.directors.count == 0 && @edifici.execucio_directors.count == 0 && @edifici.coordinadors.count == 0 && @edifici.laboratoris.count == 0 && @edifici.entitat_controls.count == 0 && @edifici.subministradors.count == 0 && @edifici.industrials.count == 0
      return false
    else
      return true
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

  def exporta_xml
    @referencies = @edifici.referencies
    #@operacions = Hash.new
    #referencies.each do |ref|
    #  op = Operacio.find(ref.operacio_id)
    #  @operacions << op
    #end
    respond_to do |format|
      format.xml do
        builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.edifici {
            xml.app "Llibre edifici"
            xml.edifici_id @edifici.id
            @referencies.each do |ref|
              operacio = Operacio.find(ref.operacio_id)
              xml.operacio {
                xml.descripcio_ca operacio.descripcio_ca
                xml.descripcio_es operacio.descripcio_es
                xml.periodicitat operacio.periodicitat
                xml.periodicitat_text_ca operacio.periodicitat_text_ca
                xml.periodicitat_text_es operacio.periodicitat_text_es
                xml.document_referencia operacio.document_referencia
                xml.responsable_ca operacio.responsable_ca
                xml.obligatorietat operacio.obligatorietat
                xml.manual_habitatge operacio.manual_habitatge
                xml.creat_usuari operacio.creat_usuari
                xml.sistema operacio.sistema
              }
            end
          }
        end
        send_data builder.to_xml, filename: "#{@edifici.nom_edifici}.xml"
      end
    end
  end

  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
end
