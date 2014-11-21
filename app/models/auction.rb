class Auction < ActiveRecord::Base
  authenticates_with_sorcery!
	authenticates_with_sorcery!

	validates :name, presence: true
	validates_format_of :name, :with => /\A((?:[-a-z]+))\z/i, :message => "of auction can only contain letters."
	validates :description, presence: true
	validates :description, length: { minimum: 15 }, on: :create
	validates :description, length: { maximum: 150 }, on: :create	
	validates_format_of :description, :with => /./, :message => "can only contain letters and numbers."
	validates :link, url: true

end

