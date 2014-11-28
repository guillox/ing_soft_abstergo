class AuctionsController < ApplicationController
  before_action :get_auction, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

 	def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params[:auction_params])
    @auction.name = params[:auction][:name]
    @auction.name = params[:auction][:name]
    @auction.description = params[:auction][:description]
    @auction.link = params[:auction][:link]
    @auction.category = params[:auction][:category]
    @auction.active = true
    @auction.owner = current_user.username
    @auction.user_id = current_user #campo obsoleto, eliminar
    
    #auction.dayC = params[:dayC]
    #auction.monthC = params[:monthC]
    if @auction.save
      redirect_to(:auctions, notice: 'Auction was succesfully created!')
    else
      render action: 'new'	
    end
  end  
 
  def edit   
  end

  def update 
		  if @auction.update(auction_params)
		    flash[:success] = "Subasta actualizada con éxito."
        respond_with(@auction, location: auctions_path)
		  else
		    render 'edit'
		  end
  end
  #def update
   # if @category.update(category_params)
    #  flash[:success] = "Categoría editada con éxito."
     # respond_with(@category, location: categories_path)
    #else
    #  render 'edit'
    # end
  #end

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
  
    def get_auction
      @auction = Auction.find(params[:id])
    end  


  def auction_params
    params.require(:auction).permit(:name, :description, :link, :category)
  end
end
