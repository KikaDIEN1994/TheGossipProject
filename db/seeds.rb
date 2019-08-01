require 'faker'

User.destroy_all
City.destroy_all
Tag.destroy_all
Gossip.destroy_all
TagGossip.destroy_all
PrivateMessage.destroy_all

cities = []
users = []

10.times do
	cities << City.create(name: Faker::Address.city, zip_code: Faker::Code.npi)
end

pms = []

20.times do
	pms << PrivateMessage.create(content: Faker::Lorem.sentences(number: 1))
end

10.times do |i|
	users << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::IDNumber.valid, email: Faker::Internet.email, age: Faker::Number.number(digits: 2), city: cities[i])
end

tags = []

10.times do
	tags << Tag.create(title: Faker::Book.title)
end

gossips = []

2.times do
	10.times do |i|
		gossips << Gossip.create(title: Faker::Game.title , content: Faker::Lorem.sentences(number: 1), user: users[i] )
	end
end

2.times do
	10.times do |i|
		TagGossip.create(tag: tags[i], gossip: gossips[i])
	end
end