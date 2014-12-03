class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :reason, presence: true
  #validates :price, presence: true
  #validates :price, numericality:true
  #validates_inclusion_of :price,in: 1..999999999999999

  scope :from_auction, ->(an_auction) { where auction_id: an_auction.id }
  
end
