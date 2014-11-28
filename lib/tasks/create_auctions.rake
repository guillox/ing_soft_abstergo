task create_auctions: :environment do
  Auction.destroy_all

end