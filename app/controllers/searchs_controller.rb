class SearchsController < ApplicationController
  def index
		@searchs = Search.all  
	end

	def show
		@nombre = params[:name]
		@cat = params[:category_id]
	end

  def result
  end

  def new
  end
end
