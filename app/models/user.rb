class User < ActiveRecord::Base
	has_secure_password
	#nambahin 2, password & password_confirmation
	#untuk authenticate
	validates :email, presence: true, uniqueness: true
end