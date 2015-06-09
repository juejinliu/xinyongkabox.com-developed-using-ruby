Deal.delete_all
Item.delete_all
User.delete_all
Comment.delete_all
Bookmark.delete_all
Like.delete_all
Deal_Price.delete_all


deal_data = JSON.parse(open('db/deals.json').read)
item_data = JSON.parse(open('db/items.json').read)

deal_data.each do |deal_hash|
  deal = Deal.new
  deal.idtemp = deal_hash['idtemp']
  deal.title=deal_hash['title']
  deal.title_picture=deal_hash['title_picture']
  # deal.purchase_link
  deal.store=deal_hash['store']
  deal.description=deal_hash['description']
  deal.category=deal_hash['category']
  # deal.detail_link: string
  deal.created_at=deal_hash['datetime']
  # deal.starts_at: datetime 
  # deal.user_id: integer
  deal.save
end

item_data.each do |item_hash|
	item=Item.new
	item.deal_id=item_hash['deal_id']
	item.description=item_hash['description']
	item.item_picture=item_hash['item_picture']
	item.link=item_hash['link']
	item.price_string=item_hash['price_string']
	item.save
end


puts "Seeded succesfully."

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
