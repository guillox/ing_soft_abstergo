class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
 	 def new
		@auction = Auction.new
  end

  def create
   @auction = Auction.new(params[:auction_params])
    @auction.name = params[:auction][:name]
	 @auction.name = params[:auction][:name]
	 @auction.description = params[:auction][:description]
	 @auction.link = params[:auction][:link]
	 @auction.active = true
	 @auction.owner = current_user.username
	 #auction.dayC = params[:dayC]
	 #auction.monthC = params[:monthC]
	 #@auction.category = params[:category]
	 if @auction.save
		redirect_to(:auctions, notice: 'Auction was succesfully created!')
	 else
		render action: 'new'	
	 end
  end
  
 
  def edit
   
  end

  def update
    respond_to do |format|
	    if ((@auction.owner == current_user.username) || (current_user.admin?)) 
		if @auction.update(auction_params)
		  format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
		  format.json { render :auctions, status: :ok, location: @auction }
		else
		  format.html { render :edit }
		  format.json { render json: @auction.errors, status: :unprocessable_entity }
		end
	    end
    end
  end

  def delete
  end

  def destroy
	if ((@auction.owner == current_user.username) || (current_user.admin?))
		@auction.active = false
		@auction.save
		redirect_to(:auctions, notice: 'Auction was succesfully deleted!')
	end
  end

  def index
	@auction = Auction.all
  end

  def show
  end

private
  
    def set_auction
      @auction = Auction.find(params[:id])
    end  


  def auction_params
    params.require(:auction).permit(:name, :description, :link, :categ.nombre)
  end
end
