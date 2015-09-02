class DeclaracionsController < ApplicationController
  before_action :set_declaracio, only: [:show, :edit, :update, :destroy]

  # GET /declaracions
  # GET /declaracions.json
  def index
    @declaracions = Declaracio.all
  end

  # GET /declaracions/1
  # GET /declaracions/1.json
  def show
  end

  # GET /declaracions/new
  def new
    @declaracio = Declaracio.new
  end

  # GET /declaracions/1/edit
  def edit
  end

  # POST /declaracions
  # POST /declaracions.json
  def create
    @declaracio = Declaracio.new(declaracio_params)

    respond_to do |format|
      if @declaracio.save
        format.html { redirect_to @declaracio, notice: 'Declaracio was successfully created.' }
        format.json { render :show, status: :created, location: @declaracio }
      else
        format.html { render :new }
        format.json { render json: @declaracio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declaracions/1
  # PATCH/PUT /declaracions/1.json
  def update
    respond_to do |format|
      if @declaracio.update(declaracio_params)
        format.html { redirect_to @declaracio, notice: 'Declaracio was successfully updated.' }
        format.json { render :show, status: :ok, location: @declaracio }
      else
        format.html { render :edit }
        format.json { render json: @declaracio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declaracions/1
  # DELETE /declaracions/1.json
  def destroy
    @declaracio.destroy
    respond_to do |format|
      format.html { redirect_to declaracions_url, notice: 'Declaracio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_declaracio
      @declaracio = Declaracio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def declaracio_params
      params.require(:declaracio).permit(:edifici_id, :notari, :n_protocol, :data_declaracio)
    end
end
