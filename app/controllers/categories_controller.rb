class CategoriesController < ApplicationController
  def index
  end

  def new
  	@categoria = Category.new
  end

  def edit
  end

  def create
  	@categoria = Category.new(params[:post])
  	@categoria.save
  end

  def destroy  	
    getCategoria
  	@categoria.destroy
  	redirect_to category_path
  end

  def getCategoria
    @categoria = Category.find(params[:id])
  end
end
