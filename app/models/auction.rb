class Auction < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates_format_of :name, :with => /\A((?:[-a-z0-9]+))\z/i, :message => "can only contain letters and numbers."
	validates :description, presence: true
	validates :description, length: { minimum: 15 }, on: :create
	validates :description, length: { maximum: 150 }, on: :create	
	validates_format_of :description, :with => /./
	validates :link, url: true

end

