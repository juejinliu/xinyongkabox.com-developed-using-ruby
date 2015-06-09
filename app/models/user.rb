class User < ActiveRecord::Base

	has_secure_password
	
	has_many :likes, :dependent => :delete_all
	has_many :comments, :dependent => :delete_all
	has_many :bookmarks, :dependent => :delete_all
	has_many :deals, :through => :bookmarks

	validates :name, :presence=> true, :uniqueness => true, :allow_nil =>false
	validates :email, :presence=> true, :uniqueness => true, :allow_nil =>false
	validates :password, :presence => true

end
