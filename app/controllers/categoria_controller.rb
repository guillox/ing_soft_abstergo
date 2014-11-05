class CategoriaController < ApplicationController
  def new
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
	@categoria = Categoria.find(params[:id])
	@categoria.destroy
	redirect_to categoria_index_path
  end
end
