class GarantiaConstructorsController < ApplicationController
  before_action :set_garantia_constructor, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_garantia_constructors
  respond_to :html, :js

  def new
    @garantia_constructor = GarantiaConstructor.new
  end

  def edit
  end

  def create
    @garantia_constructor = GarantiaConstructor.create(garantia_constructor_params)
  end

  def update
    @garantia_constructor.update_attributes(garantia_constructor_params)
  end

  def destroy
    @garantia_constructor.destroy
  end

  private
    def set_garantia_constructor
      @garantia_constructor = GarantiaConstructor.find(params[:id])
    end

    def all_garantia_constructors
      @garantia_constructors = GarantiaConstructor.where(:edifici_id => params[:edifici_id]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garantia_constructor_params
      params.require(:garantia_constructor).permit(:edifici_id, :venciment, :tipus, :referencia)
    end
end
