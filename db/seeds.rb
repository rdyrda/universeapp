# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(name:  "Red Dragon",
             email: "red@dragon.com",
             password:              "reddragon1",
             password_confirmation: "reddragon1",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "red-#{n+1}@dragon.com"
  password = "password"
  User.create!(name:  name, email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Orbs
users = User.order(:created_at).take(6)
50.times do
  category = Faker::Lorem.word
  name = Faker::Lorem.word
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.orbs.create!(category: category, name: name, 
                                        description: description) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
