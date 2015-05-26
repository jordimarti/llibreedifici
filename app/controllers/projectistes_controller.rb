class ProjectistesController < ApplicationController
  before_action :set_projectista, only: [:show, :edit, :update, :destroy]

  # GET /projectistes
  # GET /projectistes.json
  def index
    @projectistes = Projectista.all
  end

  # GET /projectistes/1
  # GET /projectistes/1.json
  def show
  end

  # GET /projectistes/new
  def new
    @projectista = Projectista.new
  end

  # GET /projectistes/1/edit
  def edit
  end

  # POST /projectistes
  # POST /projectistes.json
  def create
    @projectista = Projectista.new(projectista_params)

    respond_to do |format|
      if @projectista.save
        format.html { redirect_to @projectista, notice: 'Projectista was successfully created.' }
        format.json { render :show, status: :created, location: @projectista }
      else
        format.html { render :new }
        format.json { render json: @projectista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projectistes/1
  # PATCH/PUT /projectistes/1.json
  def update
    respond_to do |format|
      if @projectista.update(projectista_params)
        format.html { redirect_to @projectista, notice: 'Projectista was successfully updated.' }
        format.json { render :show, status: :ok, location: @projectista }
      else
        format.html { render :edit }
        format.json { render json: @projectista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projectistes/1
  # DELETE /projectistes/1.json
  def destroy
    @projectista.destroy
    respond_to do |format|
      format.html { redirect_to projectistes_url, notice: 'Projectista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projectista
      @projectista = Projectista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectista_params
      params.require(:projectista).permit(:edifici_id, :nom_projectista, :titulacio_projectista, :rao_social_projectista, :nif_projectista)
    end
end
