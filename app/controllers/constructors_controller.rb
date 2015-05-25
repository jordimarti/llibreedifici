class ConstructorsController < ApplicationController
  before_action :set_constructor, only: [:show, :edit, :update, :destroy]

  # GET /constructors
  # GET /constructors.json
  def index
    @constructors = Constructor.all
  end

  # GET /constructors/1
  # GET /constructors/1.json
  def show
  end

  # GET /constructors/new
  def new
    @constructor = Constructor.new
  end

  # GET /constructors/1/edit
  def edit
  end

  # POST /constructors
  # POST /constructors.json
  def create
    @constructor = Constructor.new(constructor_params)

    respond_to do |format|
      if @constructor.save
        format.html { redirect_to @constructor, notice: 'Constructor was successfully created.' }
        format.json { render :show, status: :created, location: @constructor }
      else
        format.html { render :new }
        format.json { render json: @constructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constructors/1
  # PATCH/PUT /constructors/1.json
  def update
    respond_to do |format|
      if @constructor.update(constructor_params)
        format.html { redirect_to @constructor, notice: 'Constructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @constructor }
      else
        format.html { render :edit }
        format.json { render json: @constructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constructors/1
  # DELETE /constructors/1.json
  def destroy
    @constructor.destroy
    respond_to do |format|
      format.html { redirect_to constructors_url, notice: 'Constructor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constructor
      @constructor = Constructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constructor_params
      params.require(:constructor).permit(:edifici_id, :nom_constructor, :nif_constructor, :tipus_via_constructor, :via_constructor, :numero_constructor, :bloc_constructor, :escala_constructor, :pis_constructor, :cp_constructor, :poblacio_constructor, :provincia_constructor, :pais_constructor)
    end
end
