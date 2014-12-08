class CategoriesController < ApplicationController
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :get_category, only: [ :edit, :update, :destroy, :show ]

  #authorize_resource

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
      redirect_to(:categories, notice: "Categoría '#{@category.name}' creada con éxito!")
    else
      render 'new'
    end
  end

  def edit    
  end

  def show    
  end

  def update
    name = @category.name

    if @category.update(category_params)
      redirect_to(:categories, notice: "Categoría '#{name}' actualizada a '#{@category.name}'")
    else
      render 'edit'
    end
  end

  def destroy  	
    @category.active = !@category.active
    @category.save

    if @category.active
      redirect_to(:categories, notice: "Categoría '#{@category.name}' desactivada!")
    else
      redirect_to(:categories, notice: "Categoría '#{@category.name}' activada!")
    end
  end  


  private

    def get_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
