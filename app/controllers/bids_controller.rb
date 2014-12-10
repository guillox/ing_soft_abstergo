class BidsController < ApplicationController
  # http://librosweb.es/libro/introduccion_rails/capitulo_6.html
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  #authorize_resource #Si no soy admin con esta linea sin comentar no puedo ver la lista de mis ofertas.
  respond_to :html, :xml, :json

  def index
	 @bids = Bid.where(user_id: current_user.id)
  end

  def show
  end

  def new
  end

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.create(bid_params)
    @bid.user_id = current_user.id

    if @bid.save
      redirect_to auction_path(@auction)
    else
      render 'auctions/show'
    end

  end

  def edit
     @bid = Bid.find params[:id]
  end

  def update
    @bid = Bid.find params[:id]
    @bid.update bid_params
	  redirect_to bids_path
    #redirect_to edit_bid_path(@bid)
  end

  def destroy
  end

  def elegir
    @bid = Bid.find params[:id]
    @auction = @bid.auction
    @auction.active = false
    @auction.bid_ganador = @bid.id
    @auction.user_ganador = @bid.user_id
    @auction.save
    
    # elegir el bid para este auction
    redirect_to(:auctions, notice: 'Subasta finalizada con éxito!')    
  end

  private

    def bid_params
      params.require(:bid).permit(:reason, :price)
    end
end
