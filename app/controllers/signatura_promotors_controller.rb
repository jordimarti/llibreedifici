class SignaturaPromotorsController < ApplicationController
  before_action :set_signatura_promotor, only: [:show, :edit, :update, :destroy]

  # GET /signatura_promotors
  # GET /signatura_promotors.json
  def index
    @signatura_promotors = SignaturaPromotor.all
  end

  # GET /signatura_promotors/1
  # GET /signatura_promotors/1.json
  def show
  end

  # GET /signatura_promotors/new
  def new
    @signatura_promotor = SignaturaPromotor.new
  end

  # GET /signatura_promotors/1/edit
  def edit
  end

  # POST /signatura_promotors
  # POST /signatura_promotors.json
  def create
    @signatura_promotor = SignaturaPromotor.new(signatura_promotor_params)

    respond_to do |format|
      if @signatura_promotor.save
        format.html { redirect_to @signatura_promotor, notice: 'Signatura promotor was successfully created.' }
        format.json { render :show, status: :created, location: @signatura_promotor }
      else
        format.html { render :new }
        format.json { render json: @signatura_promotor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signatura_promotors/1
  # PATCH/PUT /signatura_promotors/1.json
  def update
    respond_to do |format|
      if @signatura_promotor.update(signatura_promotor_params)
        format.html { redirect_to @signatura_promotor, notice: 'Signatura promotor was successfully updated.' }
        format.json { render :show, status: :ok, location: @signatura_promotor }
      else
        format.html { render :edit }
        format.json { render json: @signatura_promotor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signatura_promotors/1
  # DELETE /signatura_promotors/1.json
  def destroy
    @signatura_promotor.destroy
    respond_to do |format|
      format.html { redirect_to signatura_promotors_url, notice: 'Signatura promotor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signatura_promotor
      @signatura_promotor = SignaturaPromotor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signatura_promotor_params
      params.require(:signatura_promotor).permit(:edifici_id, :promotor_rao_social, :promotor_nom_representant)
    end
end
