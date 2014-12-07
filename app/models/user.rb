class User < ActiveRecord::Base
	has_many :auctions, dependent: :destroy
	has_many :bids
  authenticates_with_sorcery!

	validates :name, presence: true
	validates_format_of :name, :with => /\A((?:[-a-z]+))\z/i
	validates :last_name, presence: true
	validates_format_of :last_name, :with => /\A((?:[-a-z]+))\z/i
	validates :username, uniqueness: true
	validates_format_of :username, :with => /\A((?:[-a-z0-9]+))\z/i

	validates :password, length: { minimum: 6 }, confirmation: true, on: :create
	validates :password_confirmation, presence: true, on: :create

	validates :email, uniqueness: true, confirmation: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email_confirmation, presence: true, on: :create

	#def bid_from_auction(auction)
	#	bids.from_auction(auction).first
	#end

	#def oferto_en?(auction)
	#	bid_from_auction(auction).present?
	#end

	def owner_or_admin?(auction)
		if self.id == auction.user_id || self.admin?
			return true
		end

		return false
	end

	def has_bids?(auction)
		if self.bids.from_auction(auction).exists?
			return true
		end

		return false
	end

	def get_reason(auction)
		return self.bids.from_auction(auction).first.reason
	end

	def get_price(auction)
		return self.bids.from_auction(auction).first.price
	end

	def get_created_at(auction)
		return self.bids.from_auction(auction).first.created_at
	end

	def get_auctions
		return Auction.where(user_id: self.id, active: true)
	end
end

