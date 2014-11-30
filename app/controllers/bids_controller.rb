class BidsController < ApplicationController
  # http://librosweb.es/libro/introduccion_rails/capitulo_6.html
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  authorize_resource
  respond_to :html, :xml, :json

  def index
  end

  def show
  end

  def new
  end

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.create(bid_params)
    @bid.user_id = current_user.id
    @bid.save
    
    redirect_to auction_path(@auction)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

    def bid_params
      params.require(:bid).permit(:reason)
    end
end