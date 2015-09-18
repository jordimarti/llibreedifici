class ConstructorsController < ApplicationController
  before_action :set_constructor, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_constructors
  respond_to :html, :js

  def new
    @constructor = Constructor.new
  end

  def edit
  end

  def create
    @constructor = Constructor.create(constructor_params)
  end

  def update
    @constructor.update_attributes(constructor_params)
  end

  def destroy
    @constructor.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constructor
      @constructor = Constructor.find(params[:id])
    end

    def all_constructors
      @constructors = Constructor.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constructor_params
      params.require(:constructor).permit(:edifici_id, :nom_constructor, :nif_constructor, :adreca_constructor, :cp_constructor, :poblacio_constructor, :provincia_constructor, :pais_constructor, :telefon, :email, :web)
    end
end
