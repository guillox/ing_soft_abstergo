class SearchsController < ApplicationController
  def index
		@searchs = Search.all  
	end

	def show
		@nombre = params[:name]
	end

  def result
  end

  def new
  end
end
