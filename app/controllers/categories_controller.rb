class CategoriesController < ApplicationController
  before_action :get_category, only: [:edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @category = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)

    if @category.save
      flash[:success] = "Categoria creada con éxito."
      respond_with(@category, location: categories_path)
    else
      render 'new'
    end
  end

  def edit    
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Categoría editada con éxito."
      respond_with(@category, location: categories_path)
    else
      render 'edit'
     end
  end

  def destroy  	
  	@category.destroy
    flash[:alert] = "Categoría eliminada con éxito."
    respond_with(@category, location: categories_path)
  end  


  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:nombre)
  end

end
