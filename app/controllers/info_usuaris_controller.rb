class InfoUsuarisController < ApplicationController
  before_action :set_info_usuari, only: [:show, :edit, :update, :destroy]

  # GET /info_usuaris
  # GET /info_usuaris.json
  def index
    @info_usuaris = InfoUsuari.all
  end

  # GET /info_usuaris/1
  # GET /info_usuaris/1.json
  def show
  end

  # GET /info_usuaris/new
  def new
    @info_usuari = InfoUsuari.new
  end

  # GET /info_usuaris/1/edit
  def edit
  end

  # POST /info_usuaris
  # POST /info_usuaris.json
  def create
    @info_usuari = InfoUsuari.new(info_usuari_params)

    respond_to do |format|
      if @info_usuari.save
        format.html { redirect_to payment_gateway_path }
        format.json { render :show, status: :created, location: @info_usuari }
      else
        format.html { render :new }
        format.json { render json: @info_usuari.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment_gateway

  end

  # PATCH/PUT /info_usuaris/1
  # PATCH/PUT /info_usuaris/1.json
  def update
    respond_to do |format|
      if @info_usuari.update(info_usuari_params)
        format.html { redirect_to @info_usuari, notice: 'Info usuari was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_usuari }
      else
        format.html { render :edit }
        format.json { render json: @info_usuari.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_usuaris/1
  # DELETE /info_usuaris/1.json
  def destroy
    @info_usuari.destroy
    respond_to do |format|
      format.html { redirect_to info_usuaris_url, notice: 'Info usuari was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_usuari
      @info_usuari = InfoUsuari.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_usuari_params
      params.require(:info_usuari).permit(:user_id, :nom, :cognoms, :adreca, :codi_postal, :poblacio, :provincia, :pais, :telefon_fix, :telefon_mobil, :fax, :num_premaat, :num_musaat, :sexe, :any_naixement, :nif, :web)
    end
end
