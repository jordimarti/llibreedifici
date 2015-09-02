class CarreguesController < ApplicationController
  before_action :set_carrega, only: [:show, :edit, :update, :destroy]

  # GET /carregues
  # GET /carregues.json
  def index
    @carregues = Carrega.all
  end

  # GET /carregues/1
  # GET /carregues/1.json
  def show
  end

  # GET /carregues/new
  def new
    @carrega = Carrega.new
  end

  # GET /carregues/1/edit
  def edit
  end

  # POST /carregues
  # POST /carregues.json
  def create
    @carrega = Carrega.new(carrega_params)

    respond_to do |format|
      if @carrega.save
        format.html { redirect_to @carrega, notice: 'Carrega was successfully created.' }
        format.json { render :show, status: :created, location: @carrega }
      else
        format.html { render :new }
        format.json { render json: @carrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carregues/1
  # PATCH/PUT /carregues/1.json
  def update
    respond_to do |format|
      if @carrega.update(carrega_params)
        format.html { redirect_to @carrega, notice: 'Carrega was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrega }
      else
        format.html { render :edit }
        format.json { render json: @carrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carregues/1
  # DELETE /carregues/1.json
  def destroy
    @carrega.destroy
    respond_to do |format|
      format.html { redirect_to carregues_url, notice: 'Carrega was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrega
      @carrega = Carrega.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrega_params
      params.require(:carrega).permit(:edifici_id, :tipus_carrega, :document_carrega)
    end
end
