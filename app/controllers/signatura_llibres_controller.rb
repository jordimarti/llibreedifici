class SignaturaLlibresController < ApplicationController
  before_action :set_signatura_llibre, only: [:show, :edit, :update, :destroy]

  # GET /signatura_llibres
  # GET /signatura_llibres.json
  def index
    @signatura_llibres = SignaturaLlibre.all
  end

  # GET /signatura_llibres/1
  # GET /signatura_llibres/1.json
  def show
  end

  # GET /signatura_llibres/new
  def new
    @signatura_llibre = SignaturaLlibre.new
  end

  # GET /signatura_llibres/1/edit
  def edit
  end

  # POST /signatura_llibres
  # POST /signatura_llibres.json
  def create
    @signatura_llibre = SignaturaLlibre.new(signatura_llibre_params)

    respond_to do |format|
      if @signatura_llibre.save
        format.html { redirect_to @signatura_llibre, notice: 'Signatura llibre was successfully created.' }
        format.json { render :show, status: :created, location: @signatura_llibre }
      else
        format.html { render :new }
        format.json { render json: @signatura_llibre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signatura_llibres/1
  # PATCH/PUT /signatura_llibres/1.json
  def update
    respond_to do |format|
      if @signatura_llibre.update(signatura_llibre_params)
        format.html { redirect_to @signatura_llibre, notice: 'Signatura llibre was successfully updated.' }
        format.json { render :show, status: :ok, location: @signatura_llibre }
      else
        format.html { render :edit }
        format.json { render json: @signatura_llibre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signatura_llibres/1
  # DELETE /signatura_llibres/1.json
  def destroy
    @signatura_llibre.destroy
    respond_to do |format|
      format.html { redirect_to signatura_llibres_url, notice: 'Signatura llibre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signatura_llibre
      @signatura_llibre = SignaturaLlibre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signatura_llibre_params
      params.require(:signatura_llibre).permit(:edifici_id, :autor_llibre_nom, :autor_llibre_titulacio)
    end
end
