class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates :reason, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  
  validates_uniqueness_of :user_id, scope: :auction_id
  validates_presence_of :user_id

  scope :from_auction, -> (an_auction) { where auction_id: an_auction.id }
end
