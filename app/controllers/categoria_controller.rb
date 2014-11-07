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
	getCategoria
	@categoria.destroy
	redirect_to categoria_index_path
  end

	def getCategoria
	@categoria = Categoria.find(params[:id])
	end
end
