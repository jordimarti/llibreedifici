class DocumentsController < ApplicationController
  before_action :set_edifici
  include Docmosis
  include DocxGenerator
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

  def doc_pdf
    kit = PDFKit.new('http://llibreedifici.herokuapp.com/edificis/1/referencies?locale=ca')

    #tmp_file = Tempfile.new('pdf_template', "#{Rails.root}/tmp")
    file = kit.to_file(Rails.root + 'tmp/' + 'demo.pdf')

    send_file file, filename: "document.pdf", disposition: 'attachment'
  end

  def manual_manteniment
    respond_to do |format|
      format.docx do
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/docx_templates/manual_manteniment.docx", "#{Rails.root}/tmp")
        text_manteniment = ''
        existeix_sistema = comprovacio_sistema('fonamentacio')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Fonamentació')
          text_manteniment = text_manteniment + descripcio(Fonamentacio)
          text_manteniment = text_manteniment + instruccions('fonamentacio')
          text_manteniment = text_manteniment + operacions('fonamentacio')
        end
        existeix_sistema = comprovacio_sistema('estructura')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Estructura')
          text_manteniment = text_manteniment + descripcio(Estructura)
          text_manteniment = text_manteniment + instruccions('estructura')
          text_manteniment = text_manteniment + operacions('estructura')
        end
        existeix_sistema = comprovacio_sistema('tancaments')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Tancaments verticals')
          text_manteniment = text_manteniment + descripcio(TancamentsVertical)
          text_manteniment = text_manteniment + instruccions('tancaments')
          text_manteniment = text_manteniment + operacions('tancaments')
        end
        existeix_sistema = comprovacio_sistema('cobertes')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Cobertes')
          text_manteniment = text_manteniment + descripcio(Coberta)
          text_manteniment = text_manteniment + instruccions('cobertes')
          text_manteniment = text_manteniment + operacions('cobertes')
        end
        existeix_sistema = comprovacio_sistema('particions')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Particions i acabats')
          text_manteniment = text_manteniment + descripcio(Particio)
          text_manteniment = text_manteniment + instruccions('particions')
          text_manteniment = text_manteniment + operacions('particions')
        end
        existeix_sistema = comprovacio_sistema('sanejament')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Sanejament')
          text_manteniment = text_manteniment + descripcio(Sanejament)
          text_manteniment = text_manteniment + instruccions('sanejament')
          text_manteniment = text_manteniment + operacions('sanejament')
        end
        existeix_sistema = comprovacio_sistema('aigua')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Subministrament d\'aigua')
          text_manteniment = text_manteniment + descripcio(Aigua)
          text_manteniment = text_manteniment + instruccions('aigua')
          text_manteniment = text_manteniment + operacions('aigua')
        end
        existeix_sistema = comprovacio_sistema('electricitat')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Instal·lació elèctrica')
          text_manteniment = text_manteniment + descripcio(Electricitat)
          text_manteniment = text_manteniment + instruccions('electricitat')
          text_manteniment = text_manteniment + operacions('electricitat')
        end
        existeix_sistema = comprovacio_sistema('climatitzacio')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('ACS, calefacció i refrigeració')
          text_manteniment = text_manteniment + descripcio(Climatitzacio)
          text_manteniment = text_manteniment + instruccions('climatitzacio')
          text_manteniment = text_manteniment + operacions('climatitzacio')
        end
        existeix_sistema = comprovacio_sistema('gas')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Instal·lació de gas')
          text_manteniment = text_manteniment + descripcio(Ga)
          text_manteniment = text_manteniment + instruccions('gas')
          text_manteniment = text_manteniment + operacions('gas')
        end
        existeix_sistema = comprovacio_sistema('ventilacio')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Ventilació')
          text_manteniment = text_manteniment + descripcio(Ventilacio)
          text_manteniment = text_manteniment + instruccions('ventilacio')
          text_manteniment = text_manteniment + operacions('ventilacio')
        end
        existeix_sistema = comprovacio_sistema('incendis')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Protecció contra incendis')
          text_manteniment = text_manteniment + descripcio(Incendi)
          text_manteniment = text_manteniment + instruccions('incendis')
          text_manteniment = text_manteniment + operacions('incendis')
        end
        existeix_sistema = comprovacio_sistema('ascensor')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Ascensors')
          text_manteniment = text_manteniment + descripcio(Ascensor)
          text_manteniment = text_manteniment + instruccions('ascensor')
          text_manteniment = text_manteniment + operacions('ascensor')
        end
        existeix_sistema = comprovacio_sistema('telecomunicacions')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Instal·lació de telecomunicacions')
          text_manteniment = text_manteniment + descripcio(Telecomunicacio)
          text_manteniment = text_manteniment + instruccions('telecomunicacions')
          text_manteniment = text_manteniment + operacions('telecomunicacions')
        end
        existeix_sistema = comprovacio_sistema('especials')
        if existeix_sistema == true
          text_manteniment = text_manteniment + titol('Instal·lacions especials')
          text_manteniment = text_manteniment + descripcio(Especial)
          text_manteniment = text_manteniment + instruccions('especials')
          text_manteniment = text_manteniment + operacions('especials')
        end
        doc.replace("$text_manteniment$", text_manteniment)

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


  private

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end
end
