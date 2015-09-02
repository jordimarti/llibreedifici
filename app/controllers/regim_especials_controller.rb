class RegimEspecialsController < ApplicationController
  before_action :set_regim_especial, only: [:show, :edit, :update, :destroy]

  # GET /regim_especials
  # GET /regim_especials.json
  def index
    @regim_especials = RegimEspecial.all
  end

  # GET /regim_especials/1
  # GET /regim_especials/1.json
  def show
  end

  # GET /regim_especials/new
  def new
    @regim_especial = RegimEspecial.new
  end

  # GET /regim_especials/1/edit
  def edit
  end

  # POST /regim_especials
  # POST /regim_especials.json
  def create
    @regim_especial = RegimEspecial.new(regim_especial_params)

    respond_to do |format|
      if @regim_especial.save
        format.html { redirect_to @regim_especial, notice: 'Regim especial was successfully created.' }
        format.json { render :show, status: :created, location: @regim_especial }
      else
        format.html { render :new }
        format.json { render json: @regim_especial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regim_especials/1
  # PATCH/PUT /regim_especials/1.json
  def update
    respond_to do |format|
      if @regim_especial.update(regim_especial_params)
        format.html { redirect_to @regim_especial, notice: 'Regim especial was successfully updated.' }
        format.json { render :show, status: :ok, location: @regim_especial }
      else
        format.html { render :edit }
        format.json { render json: @regim_especial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regim_especials/1
  # DELETE /regim_especials/1.json
  def destroy
    @regim_especial.destroy
    respond_to do |format|
      format.html { redirect_to regim_especials_url, notice: 'Regim especial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regim_especial
      @regim_especial = RegimEspecial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regim_especial_params
      params.require(:regim_especial).permit(:edifici_id, :tipus_regim_especial, :referencia_document)
    end
end
