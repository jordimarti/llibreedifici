class PagamentsController < ApplicationController
  # Posem skip pq vindrà d'un servidor extern i no hi haurà authenticity token
  skip_before_filter :verify_authenticity_token
  before_action :set_pagament, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici, only: [:index, :show, :new, :edit, :create, :destroy]

  # GET /pagaments
  # GET /pagaments.json
  def index
    @pagaments = Pagament.all
  end

  # GET /pagaments/1
  # GET /pagaments/1.json
  def show
  end

  # GET /pagaments/new
  def new
    @pagament = Pagament.new
  end

  # GET /pagaments/1/edit
  def edit
  end

  # POST /pagaments
  # POST /pagaments.json
  def crear_pagament
    @pagament = Pagament.new()
    @pagament.user_id = current_user.id
    @pagament.edifici_id = 1
    @pagament.numorder = numorder()
    @pagament.import = "42,96"
    #@pagament.pagat = false
    titular = current_user.name
    url_pagament = 'http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx?titular=Titular&importe=' + @pagament.import + '&numorder=' + @pagament.numorder.to_s + '&descripcion=llibreedifici'
    
    
    #response = HTTParty.get(url_pagament)
    #response = response.parsed_response
    #puts response
    
    #body = JSON.parse(response.body)
    #puts body
    #puts HTTParty.get(url_pagament)
    #@pagament.resultado = response[0]["resultado"]
    #@pagament.autorizacion = response[0]["autorizacion"]


    #uri = URI("http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx")
    #params = {"titular" => "Titular", "importe" => @pagament.import, "numorder" => @pagament.numorder.to_s, "descripcion" => "llibreedifici"}

    #uri.query = URI.encode_www_form(params)
    #http = Net::HTTP.new(uri.host, uri.port)
    #response = Net::HTTP.get_response(uri)
    #response = http.request(Net::HTTP::Get.new(uri.request_uri))
    
    #puts response.body
    #body = JSON.parse(response.body)
    #puts body
    #response = Net::HTTP.get_response(uri)
    #response = redirect_to url_pagament
    #puts response.body
    #response = response.body

    #url = URI.parse('http://isis.apabcn.cat/LibroEdificio/pagoVisa.aspx')
    #params = {titular: "Titular", importe: @pagament.import, numorder: @pagament.numorder.to_s, descripcion: "llibreedifici"}
    #req = Net::HTTP::Get.new(url.path, params)
    #response = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    #puts response.body

    #response = redirect_to url_pagament
    #puts response.code
    #puts response.body
    #puts response.location

    #Faraday
    #url = 'http://isis.apabcn.cat'
 
    #conn = Faraday.new(url: url) do |faraday|
    #  faraday.adapter Faraday.default_adapter
    #  faraday.response :json
    #end
     
    #response = conn.get('LibroEdificio/pagoVisa.aspx', titular: 'Jordi', importe: '42,96', numorder: '110000000030', descripcion: 'llibreedifici')
    #puts response.body
    

    #if @pagament.resultado == "0000"
    #  @pagament.pagat = true
    #else
    #  @pagament.pagat = false
    #end
    #@pagament.resultado = response[0]["resultado"]
    #@pagament.autorizacion = response[0]["autorizacion"]
    #@pagament.save
    
    #respond_to do |format|
    #  if @pagament.save
    #    format.html { redirect_to url_pagament }
    #    format.json { render :show, status: :created, location: @pagament }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @pagament.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  def numorder
    ultim_pagament = Pagament.last
    if ultim_pagament
      numorder = ultim_pagament.numorder + 1
      return numorder
    else
      return 110000000001
    end   
  end

  # PATCH/PUT /pagaments/1
  # PATCH/PUT /pagaments/1.json
  #def update
  #  pagament = Pagament.where(:numorder => params[:numorder])
  #  respond_to do |format|
  #    if pagament.update(pagament_params)
  #      format.html { redirect_to @pagament, notice: 'Pagament was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @pagament }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @pagament.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update_pagament                  
    pagament = Pagament.where(:numorder => params[:numorder]).last
    if pagament != nil
      if pagament.numorder != nil
        pagament.update(pagament_params)
        pagament.pagat = true
      else
        pagament.pagat = false
      end
      pagament.save
      @info_pagament = pagament
      render json: pagament
    end
  end

  # DELETE /pagaments/1
  # DELETE /pagaments/1.json
  def destroy
    @pagament.destroy
    respond_to do |format|
      format.html { redirect_to pagaments_url, notice: 'Pagament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagament
      @pagament = Pagament.find(params[:id])
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagament_params
      params.require(:pagament).permit(:user_id, :edifici_id, :numorder, :import, :resultado, :autorizacion, :pagat)
    end
end
