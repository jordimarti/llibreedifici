class DocumentsController < ApplicationController
  before_action :set_edifici
  layout 'edifici'

  def index
    @submenu_actiu = 'documents'
  end

  def quadern
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
