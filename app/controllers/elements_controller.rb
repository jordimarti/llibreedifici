class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]
  before_action :set_edifici
  before_action :all_elements
  respond_to :html, :js
  
  def new
    @element = Element.new
  end

  def edit
  end

  def create
    @element = Element.create(element_params)
    @elements = Element.where(:edifici_id => element_params[:edifici_id], :sistema_element => element_params[:sistema_element])
  end

  def update
    @element.update_attributes(element_params)
    @elements = Element.where(:edifici_id => element_params[:edifici_id], :sistema_element => element_params[:sistema_element])
  end

  def destroy
    sistema = @element.sistema_element
    @element.destroy
    @elements = Element.where(:edifici_id => @edifici.id, :sistema_element => sistema)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    def all_elements
      @elements = Element.where(:edifici_id => params[:edifici_id], :sistema_element => params[:sistema]).order(:created_at)
    end

    def set_edifici
      @edifici = Edifici.find(params[:edifici_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:element).permit(:edifici_id, :nom_element, :sistema_element)
    end
end
