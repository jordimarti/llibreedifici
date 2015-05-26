class ExecucioDirectorsController < ApplicationController
  before_action :set_execucio_director, only: [:show, :edit, :update, :destroy]

  # GET /execucio_directors
  # GET /execucio_directors.json
  def index
    @execucio_directors = ExecucioDirector.all
  end

  # GET /execucio_directors/1
  # GET /execucio_directors/1.json
  def show
  end

  # GET /execucio_directors/new
  def new
    @execucio_director = ExecucioDirector.new
  end

  # GET /execucio_directors/1/edit
  def edit
  end

  # POST /execucio_directors
  # POST /execucio_directors.json
  def create
    @execucio_director = ExecucioDirector.new(execucio_director_params)

    respond_to do |format|
      if @execucio_director.save
        format.html { redirect_to @execucio_director, notice: 'Execucio director was successfully created.' }
        format.json { render :show, status: :created, location: @execucio_director }
      else
        format.html { render :new }
        format.json { render json: @execucio_director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /execucio_directors/1
  # PATCH/PUT /execucio_directors/1.json
  def update
    respond_to do |format|
      if @execucio_director.update(execucio_director_params)
        format.html { redirect_to @execucio_director, notice: 'Execucio director was successfully updated.' }
        format.json { render :show, status: :ok, location: @execucio_director }
      else
        format.html { render :edit }
        format.json { render json: @execucio_director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /execucio_directors/1
  # DELETE /execucio_directors/1.json
  def destroy
    @execucio_director.destroy
    respond_to do |format|
      format.html { redirect_to execucio_directors_url, notice: 'Execucio director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_execucio_director
      @execucio_director = ExecucioDirector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def execucio_director_params
      params.require(:execucio_director).permit(:edifici_id, :nom_director_execucio, :titulacio_director_execucio, :rao_social_director_execucio, :nif_director_execucio)
    end
end
