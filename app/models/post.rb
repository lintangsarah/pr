class Post < ActiveRecord::Base
	validates :name, uniqueness:true, presence: true
	validates :longitude, uniqueness:true, presence: true
	validates :latitude, uniqueness:true, presence: true
end
