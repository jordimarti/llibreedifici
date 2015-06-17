class DadesEdificiNousController < ApplicationController
  before_action :set_dades_edifici_nou, only: [:show, :edit, :update, :destroy]
  layout 'edifici'

  # GET /dades_edifici_nous
  # GET /dades_edifici_nous.json
  def index
    @dades_edifici_nous = DadesEdificiNou.all
  end

  # GET /dades_edifici_nous/1
  # GET /dades_edifici_nous/1.json
  def show
  end

  # GET /dades_edifici_nous/new
  def new
    @dades_edifici_nou = DadesEdificiNou.new
  end

  # GET /dades_edifici_nous/1/edit
  def edit
    @menu_actiu = 'quadern'
    @edifici = Edifici.find(params[:id])
    @dades_edifici = DadesEdificiNou.where(:edifici_id => @edifici.id).last
    if @edifici.user_id != current_user.id
      redirect_to controller: "home", action: "permisos"
    end
  end

  # POST /dades_edifici_nous
  # POST /dades_edifici_nous.json
  def create
    @dades_edifici_nou = DadesEdificiNou.new(dades_edifici_nou_params)

    respond_to do |format|
      if @dades_edifici_nou.save
        format.html { redirect_to @dades_edifici_nou, notice: 'Dades edifici nou was successfully created.' }
        format.json { render :show, status: :created, location: @dades_edifici_nou }
      else
        format.html { render :new }
        format.json { render json: @dades_edifici_nou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dades_edifici_nous/1
  # PATCH/PUT /dades_edifici_nous/1.json
  def update
    respond_to do |format|
      if @dades_edifici_nou.update(dades_edifici_nou_params)
        format.html { redirect_to @dades_edifici_nou, notice: 'Dades edifici nou was successfully updated.' }
        format.json { render :show, status: :ok, location: @dades_edifici_nou }
      else
        format.html { render :edit }
        format.json { render json: @dades_edifici_nou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dades_edifici_nous/1
  # DELETE /dades_edifici_nous/1.json
  def destroy
    @dades_edifici_nou.destroy
    respond_to do |format|
      format.html { redirect_to dades_edifici_nous_url, notice: 'Dades edifici nou was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dades_edifici_nou
      @dades_edifici_nou = DadesEdificiNou.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dades_edifici_nou_params
      params.require(:dades_edifici_nou).permit(:edifici_id, :tipus_via_edifici, :via_edifici, :numero_edifici, :bloc_edifici, :escala_edifici, :cp_edifici, :poblacio_edifici, :provincia_edifici, :ref_cadastral, :us_edifici, :any_inici_construccio, :any_fi_construccio)
    end
end
