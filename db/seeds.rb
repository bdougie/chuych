# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

rand(10..30).times do
	p = Post.create(body: Faker::Lorem.words(3..12)).join(" ")
end

puts"Seeds Finished"
puts "#{Post.count} posts created"