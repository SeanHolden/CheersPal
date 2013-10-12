# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Gift.create(sender_id:12345,
#             sender_firstname: "Sean",
#             sender_lastname: "Holden",
#             receiver_id: 54321,
#             receiver_firstname: "Joe",
#             receiver_lastname: "Bloggs",
#             amount: 400,
#             title: "beer",
#             sent_time: 1381613365)

user = User.create(email:"seanholden1@gmail.com", firstname:"sean", lastname:"holden")

user.gifts.create(sender_id:user.email, receiver_id:"some_guy@someemail.com", amount:400, title:"beer", sent_time:1381613365)

user2 = User.create(email:"someperson@gmail.com", firstname:"joe", lastname:"bloggs")

user2.gifts.create(sender_id:user2.email, receiver_id:"seanholden1@gmail.com", amount:400, title:"beer", sent_time:1381613355)