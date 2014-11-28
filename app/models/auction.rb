class Auction < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
  has_one :image

	validates :name, presence: true
	validates_format_of :name, :with => /[a-z\s]/i, :message => "can only contain letters and numbers."

	validates :description, presence: true
	validates_format_of :description, :with => /./
  
	validates :link, url: true
end

