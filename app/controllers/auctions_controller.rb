class AuctionsController < ApplicationController
  def new
		@auction = Auction.new
  end

  def create
    @auction = Auction.new
		@auction.name = params[:name]
		@auction.link = params[:link]
		@auction.description = params[:description]
		@auction.save
		redirect_to(:auctions, notice: 'Auction was succesfully created!')
	end

  def edit
  end

  def delete
  end

  def index
  end

  def show
  end
end
