class Auction < ActiveRecord::Base
	belongs_to :user
  belongs_to :category
  has_many :bids

	validates :name, presence: true
	validates_format_of :name, :with => /[a-z\s]/i, :message => "can only contain letters and numbers."

	validates :description, presence: true
	validates_format_of :description, :with => /./

  def user_owner?(current_user)
    if current_user.id == self.user_id || current_user.admin?
        return true
      end

    return false
  end

  dragonfly_accessor :image  #defines a reader/writer for image
end

