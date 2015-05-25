class ProjectistaController < ApplicationController
  before_action :set_projectistum, only: [:show, :edit, :update, :destroy]

  # GET /projectista
  # GET /projectista.json
  def index
    @projectista = Projectistum.all
  end

  # GET /projectista/1
  # GET /projectista/1.json
  def show
  end

  # GET /projectista/new
  def new
    @projectistum = Projectistum.new
  end

  # GET /projectista/1/edit
  def edit
  end

  # POST /projectista
  # POST /projectista.json
  def create
    @projectistum = Projectistum.new(projectistum_params)

    respond_to do |format|
      if @projectistum.save
        format.html { redirect_to @projectistum, notice: 'Projectistum was successfully created.' }
        format.json { render :show, status: :created, location: @projectistum }
      else
        format.html { render :new }
        format.json { render json: @projectistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projectista/1
  # PATCH/PUT /projectista/1.json
  def update
    respond_to do |format|
      if @projectistum.update(projectistum_params)
        format.html { redirect_to @projectistum, notice: 'Projectistum was successfully updated.' }
        format.json { render :show, status: :ok, location: @projectistum }
      else
        format.html { render :edit }
        format.json { render json: @projectistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projectista/1
  # DELETE /projectista/1.json
  def destroy
    @projectistum.destroy
    respond_to do |format|
      format.html { redirect_to projectista_url, notice: 'Projectistum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projectistum
      @projectistum = Projectistum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectistum_params
      params.require(:projectistum).permit(:edifici_id, :nom_projectista, :titulacio_projectista, :rao_social_projectista, :nif_projectista)
    end
end
