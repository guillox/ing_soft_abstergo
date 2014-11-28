class Category < ActiveRecord::Base
  has_many :auctions

	validates :nombre, presence: true, uniqueness: true, length: { maximum: 30 }

	default_scope -> {order(:nombre)}  
  
end