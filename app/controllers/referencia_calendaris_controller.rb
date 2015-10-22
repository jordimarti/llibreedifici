class ReferenciaCalendarisController < ApplicationController
  before_action :set_referencia_calendari, only: [:show, :edit, :update, :destroy]

  # GET /referencia_calendaris
  # GET /referencia_calendaris.json
  def index
    @referencia_calendaris = ReferenciaCalendari.all
  end

  # GET /referencia_calendaris/1
  # GET /referencia_calendaris/1.json
  def show
  end

  # GET /referencia_calendaris/new
  def new
    @referencia_calendari = ReferenciaCalendari.new
  end

  # GET /referencia_calendaris/1/edit
  def edit
  end

  # POST /referencia_calendaris
  # POST /referencia_calendaris.json
  def create
    @referencia_calendari = ReferenciaCalendari.new(referencia_calendari_params)

    respond_to do |format|
      if @referencia_calendari.save
        format.html { redirect_to @referencia_calendari, notice: 'Referencia calendari was successfully created.' }
        format.json { render :show, status: :created, location: @referencia_calendari }
      else
        format.html { render :new }
        format.json { render json: @referencia_calendari.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencia_calendaris/1
  # PATCH/PUT /referencia_calendaris/1.json
  def update
    respond_to do |format|
      if @referencia_calendari.update(referencia_calendari_params)
        format.html { redirect_to @referencia_calendari, notice: 'Referencia calendari was successfully updated.' }
        format.json { render :show, status: :ok, location: @referencia_calendari }
      else
        format.html { render :edit }
        format.json { render json: @referencia_calendari.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencia_calendaris/1
  # DELETE /referencia_calendaris/1.json
  def destroy
    @referencia_calendari.destroy
    respond_to do |format|
      format.html { redirect_to referencia_calendaris_url, notice: 'Referencia calendari was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia_calendari
      @referencia_calendari = ReferenciaCalendari.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referencia_calendari_params
      params.require(:referencia_calendari).permit(:edifici_id, :operacio_id, :any)
    end
end
