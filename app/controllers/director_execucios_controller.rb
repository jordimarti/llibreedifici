class DirectorExecuciosController < ApplicationController
  before_action :set_director_execucio, only: [:show, :edit, :update, :destroy]

  # GET /director_execucios
  # GET /director_execucios.json
  def index
    @director_execucios = DirectorExecucio.all
  end

  # GET /director_execucios/1
  # GET /director_execucios/1.json
  def show
  end

  # GET /director_execucios/new
  def new
    @director_execucio = DirectorExecucio.new
  end

  # GET /director_execucios/1/edit
  def edit
  end

  # POST /director_execucios
  # POST /director_execucios.json
  def create
    @director_execucio = DirectorExecucio.new(director_execucio_params)

    respond_to do |format|
      if @director_execucio.save
        format.html { redirect_to @director_execucio, notice: 'Director execucio was successfully created.' }
        format.json { render :show, status: :created, location: @director_execucio }
      else
        format.html { render :new }
        format.json { render json: @director_execucio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /director_execucios/1
  # PATCH/PUT /director_execucios/1.json
  def update
    respond_to do |format|
      if @director_execucio.update(director_execucio_params)
        format.html { redirect_to @director_execucio, notice: 'Director execucio was successfully updated.' }
        format.json { render :show, status: :ok, location: @director_execucio }
      else
        format.html { render :edit }
        format.json { render json: @director_execucio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /director_execucios/1
  # DELETE /director_execucios/1.json
  def destroy
    @director_execucio.destroy
    respond_to do |format|
      format.html { redirect_to director_execucios_url, notice: 'Director execucio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_director_execucio
      @director_execucio = DirectorExecucio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def director_execucio_params
      params.require(:director_execucio).permit(:edifici_id, :nom_director_execucio, :titulacio_director_execucio, :rao_social_director_execucio, :nif_director_execucio)
    end
end
