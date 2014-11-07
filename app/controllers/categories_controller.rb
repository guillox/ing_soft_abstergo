class CategoriesController < ApplicationController
  def index
  end

  def new
  	@category = Category.new
  end

  def edit
  end

  def create
  	@category = Category.new(category_params)
    if @category.save
      render 'index'
    else
      render 'new'
    end
  end

  def destroy  	
    get_categoria
  	@category.destroy
  	redirect_to categories_path
  end

  def get_categoria
    @category = Category.find(params[:id])
  end
###############################################################################
  private

  def category_params
    params.require(:category).permit(:nombre)
  end

end
