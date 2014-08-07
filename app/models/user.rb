class User < ActiveRecord::Base
	before_create :set_auth_token
	#masukin token dulu
	has_secure_password
	#nambahin 2, password & password_confirmation
	#untuk authenticate
	validates :email, presence: true, uniqueness: true
	
	def set_auth_token
		#looping dan generate number
		#break dr loop kalo ketemu number yg blm kepake
		self.auth_token = loop do
			token = SecureRandom.hex
			break token unless self.class.exists?(auth_token: token)
		end

	end
end