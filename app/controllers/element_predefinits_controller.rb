class ElementPredefinitsController < ApplicationController
  before_action :set_element_predefinit, only: [:show, :edit, :update, :destroy]

  # GET /element_predefinits
  # GET /element_predefinits.json
  def index
    @element_predefinits = ElementPredefinit.all
  end

  # GET /element_predefinits/1
  # GET /element_predefinits/1.json
  def show
  end

  # GET /element_predefinits/new
  def new
    @element_predefinit = ElementPredefinit.new
  end

  # GET /element_predefinits/1/edit
  def edit
  end

  # POST /element_predefinits
  # POST /element_predefinits.json
  def create
    @element_predefinit = ElementPredefinit.new(element_predefinit_params)

    respond_to do |format|
      if @element_predefinit.save
        format.html { redirect_to @element_predefinit, notice: 'Element predefinit was successfully created.' }
        format.json { render :show, status: :created, location: @element_predefinit }
      else
        format.html { render :new }
        format.json { render json: @element_predefinit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /element_predefinits/1
  # PATCH/PUT /element_predefinits/1.json
  def update
    respond_to do |format|
      if @element_predefinit.update(element_predefinit_params)
        format.html { redirect_to @element_predefinit, notice: 'Element predefinit was successfully updated.' }
        format.json { render :show, status: :ok, location: @element_predefinit }
      else
        format.html { render :edit }
        format.json { render json: @element_predefinit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /element_predefinits/1
  # DELETE /element_predefinits/1.json
  def destroy
    @element_predefinit.destroy
    respond_to do |format|
      format.html { redirect_to element_predefinits_url, notice: 'Element predefinit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element_predefinit
      @element_predefinit = ElementPredefinit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_predefinit_params
      params.require(:element_predefinit).permit(:nom_element, :sistema_element, :descripcio_ca, :descripcio_es)
    end
end
