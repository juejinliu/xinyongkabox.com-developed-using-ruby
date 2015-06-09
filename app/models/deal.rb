class Deal < ActiveRecord::Base
	has_many :items, :dependent => :delete_all
	has_many :likes, :dependent => :delete_all
	has_many :comments, :dependent => :delete_all
	has_many :bookmarks, :dependent => :delete_all
	has_many :deal_price, :dependent => :delete_all
	has_many :users, :through => :bookmarks

	validates_presence_of :title
	validates_presence_of :title_picture
	validates_presence_of :description
end
