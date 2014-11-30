class Bid < ActiveRecord::Base
  #belongs_to :user
  belongs_to :auction

  validates :reason, presence: true
end
