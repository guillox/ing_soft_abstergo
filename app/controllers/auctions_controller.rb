class AuctionsController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]
  before_action :get_auction, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]  
  respond_to :html, :xml, :json

  def index
    @auction = Auction.all
  end

  def show
  end

 	def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user_id = current_user.id 

    if @auction.save
      redirect_to(:auctions, notice: 'Subasta creada con éxito!')
    else
      render action: 'new'	
    end
  end  
 
  def edit   
  end

  def update 
		if @auction.update(auction_params)
		  redirect_to(:auctions, notice: 'Subasta actualizada con éxito!')
		else
		  render 'edit'
		end
  end

  def destroy
  	if ((@auction.user_id == current_user.id) || (current_user.admin?))
  		@auction.active = false
  		@auction.save
  		redirect_to(:auctions, notice: 'Subasta eliminada con éxito!')
  	end
  end


  private
  
    def get_auction
      @auction = Auction.find(params[:id])
    end  

    def auction_params
      params.require(:auction).permit(:name, :description, :link, :category_id, :image_id)
    end

    def verify_user
      if current_user.id == @auction.user_id || current_user.admin?
        return true
      end

      return false
    end
end
