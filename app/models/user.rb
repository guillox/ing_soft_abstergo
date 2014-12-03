class User < ActiveRecord::Base
	has_many :auctions, dependent: :destroy
	has_many :bids
  authenticates_with_sorcery!

	validates :name, presence: true
	validates_format_of :name, :with => /\A((?:[-a-z]+))\z/i, :message => "can only contain letters."
	validates :last_name, presence: true
	validates_format_of :last_name, :with => /\A((?:[-a-z]+))\z/i, :message => "can only contain letters."
	validates :username, uniqueness: true
	validates_format_of :username, :with => /\A((?:[-a-z0-9]+))\z/i ,:message => "can only contain letters and numbers."

	validates :password, length: { minimum: 6 }, confirmation: true, on: :create
	validates :password_confirmation, presence: true, on: :create

	validates :email, uniqueness: true, confirmation: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email_confirmation, presence: true, on: :create

	def bid_from_auction(auction)
		bids.from_auction(auction).first
	end

	def oferto_en?(auction)
		bid_from_auction(auction).present?
	end

end

