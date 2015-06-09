Deal.delete_all
User.delete_all
Comment.delete_all
Bookmark.delete_all
Like.delete_all


deal_data = JSON.parse(open('db/deals.json').read)

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

u1=User.new
u1.name="user1"
u1.email="user1@example.com"
u1.password="user1"
u1.save

u2=User.new
u2.name="user2"
u2.email="user2@example.com"
u2.password="user2"
u2.save



puts "Seeded succesfully."

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
