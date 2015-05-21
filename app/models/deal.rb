class Deal < ActiveRecord::Base
	has_many :items
	has_many :likes
	has_many :comments
	has_many :bookmarks
	belongs_to :deal_price
	has_many :users, :through => :bookmarks

	validates_presence_of :title
	validates_presence_of :title_picture
	validates_presence_of :purchase_link
	validates_presence_of :description
end
