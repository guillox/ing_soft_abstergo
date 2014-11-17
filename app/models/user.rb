class User < ActiveRecord::Base
  authenticates_with_sorcery!
	authenticates_with_sorcery!

	validates :name, presence: true
	validates :last_name, presence: true
	validates :username, uniqueness: true

	validates :password, length: { minimum: 3 }, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true, confirmation: true
	validates :email_confirmation, presence: true
end
