class User < ActiveRecord::Base
	has_many :likes
	has_many :comments
	has_many :bookmarks
	has_many :deals, :through => :bookmarks

	validates :name, :uniqueness => true, :allow_nil =>false
	validates :email, :uniqueness => true, :allow_nil =>false
	validates :password, :presence => true

end
