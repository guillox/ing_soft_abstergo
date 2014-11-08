class Category < ActiveRecord::Base
	validates :nombre, absence: true, uniqueness: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z]+\z/ }
end