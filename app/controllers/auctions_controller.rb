class AuctionsController < ApplicationController
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :get_auction, only: [:show, :edit, :update, :destroy]
  authorize_resource #con esta linea sin comentar, no puedo acceder a "Mis Subastas"
  respond_to :html, :xml, :json

  def index
    @auction = Auction.where(active: true)
  end

  def myAuctions 
    #@auction = Auction.all  
  end

  def finalizar
    @auction = Auction.where("ends_at <= ?", Time.now)
    @auction = @auction.where(user_id: current_user.id, active: true)
  end

  def finalizadas
    @auction = Auction.where.not(ganador: nil)
    @auction = @auction.where(user_id: current_user.id, active: false)
  end

  def ganadas    
    @auction = Auction.where(ganador: current_user.id, active: false)
  end

  def show
    #@bid = @auction.bids.build
    @bid = Bid.new
  end

 	def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user_id = current_user.id 
    @auction.ends_at = Time.now + 20.days

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
  	@auction.active = false
  	@auction.save
  	redirect_to(:auctions, notice: 'Subasta eliminada con éxito!')  	
  end


  private
  
    def get_auction
      @auction = Auction.find(params[:id])
    end  

    def auction_params
      params.require(:auction).permit(:name, :description, :category_id, :image)
    end
end
