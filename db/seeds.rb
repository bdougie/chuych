# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create 25 Churches 
25.times do
	c = Church.create(
		name: Faker::Lorem.words(2..3).join(" "),
		city: Faker::Address.city,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
		description: Faker::Lorem.words(3..12).join(" "))
end


#create 15 users

# crude workaround to randomly-generated username collisions
usernames = Faker::Lorem.words(rand(9..15)).uniq
usernames.each do |username|
	password = Faker::Lorem.characters(10)
	u = User.new(
	  name: Faker::Name.name,
    username: username, 
	  email: Faker::Internet.email, 
	  password: password, 
	  password_confirmation: password)
	u.skip_confirmation!
	u.save!

		# create about 30 post
		 15.times do
		    p = u.posts.create(body: Faker::Lorem.words(3..12).join(" "))
		    p.update_attribute(:created_at, Time.now - rand(600..31536000))

		 end


 end

u = User.new(
  name: 'Admin User',
  username: 'admin',
  email: 'admin@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

u = User.new(
  name: 'Moderator User',
  username: 'moderator',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')

u = User.new(
  name: 'Member User',
  username: 'member',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save


puts"Seeds Finished"
puts "#{Post.count} posts created"
puts "#{User.count} users created"
puts "#{Church.count} church created"
