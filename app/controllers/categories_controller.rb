class CategoriesController < ApplicationController
  before_action :get_category, only: [:edit, :update, :destroy]

  def index
    @category = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
    # render json: category_params and return
  	@category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit    
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
     end
  end

  def destroy  	
  	@category.destroy
  	redirect_to categories_path
  end  
###############################################################################
  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:nombre)
  end

end
