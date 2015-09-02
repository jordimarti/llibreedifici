class LlicenciesController < ApplicationController
  before_action :set_llicencia, only: [:show, :edit, :update, :destroy]

  # GET /llicencies
  # GET /llicencies.json
  def index
    @llicencies = Llicencia.all
  end

  # GET /llicencies/1
  # GET /llicencies/1.json
  def show
  end

  # GET /llicencies/new
  def new
    @llicencia = Llicencia.new
  end

  # GET /llicencies/1/edit
  def edit
  end

  # POST /llicencies
  # POST /llicencies.json
  def create
    @llicencia = Llicencia.new(llicencia_params)

    respond_to do |format|
      if @llicencia.save
        format.html { redirect_to @llicencia, notice: 'Llicencia was successfully created.' }
        format.json { render :show, status: :created, location: @llicencia }
      else
        format.html { render :new }
        format.json { render json: @llicencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /llicencies/1
  # PATCH/PUT /llicencies/1.json
  def update
    respond_to do |format|
      if @llicencia.update(llicencia_params)
        format.html { redirect_to @llicencia, notice: 'Llicencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @llicencia }
      else
        format.html { render :edit }
        format.json { render json: @llicencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /llicencies/1
  # DELETE /llicencies/1.json
  def destroy
    @llicencia.destroy
    respond_to do |format|
      format.html { redirect_to llicencies_url, notice: 'Llicencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_llicencia
      @llicencia = Llicencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def llicencia_params
      params.require(:llicencia).permit(:edifici_id, :classe, :data_llicencia)
    end
end
