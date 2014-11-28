class Category < ActiveRecord::Base
  has_many :auctions

	validates :name, presence: true, uniqueness: true, length: { maximum: 30 }

	default_scope -> {order(:name)}  
  
end