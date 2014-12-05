auctions = {
  :auction_01 => { :name => "Naruto Shippuden FULL BURST [PC]", :description => "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32.", :category_id => 10, :user_id => 2, :image_uid => "2014/11/30/53d5jpo7q9_Naruto_5.png", :image_name => "Naruto-5.png" }
}

def create_auction(auction_values)
  auction = Auction.new auction_values
  auction.ends_at = (Time.now + 20.days)
  auction.save
end

task create_auctions: :environment do
  puts "############ BEGIN create_auctions"

  Auction.destroy_all

  
  5.times do
    auctions.each_pair do |auction_key, auction_values|
      puts "-> #{auction_key}"
      create_auction(auction_values)
    end
  end

  puts "############ END create_users"

end