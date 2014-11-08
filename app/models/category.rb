class Category < ActiveRecord::Base
	validates :nombre, presence: true, uniqueness: true, length: { maximum: 30 }

	default_scope -> {order(:nombre)}
end