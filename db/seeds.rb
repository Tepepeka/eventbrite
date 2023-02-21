# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Destroy_all
User.destroy_all
Event.destroy_all
Attendance.destroy_all

# Users create
10.times do |i|
    name = Faker::Name.first_name
    password = Faker::Internet.password(min_length: 6, max_length: 10)
    User.create(
        name:name,
        email:"#{name}@yopmail.com",
        password:password,
        password_confirmation:password
    )
    puts "*"*(i+1)
    puts "#{i+1} user(s) created"
end


# Events create
5.times do |i|
    Event.create(
        start_date:Faker::Date.forward,
        title:Faker::Sports::Basketball.team,
        duration:rand(1..20)*5,
        price:rand(2..100),
        location:Faker::Address.community
    )
    puts "*"*(i+1)
    puts "#{i+1} event(s) created"
end


# Attendance create
20.times do |i|
    Attendance.create(
        user_id:User.all.sample.id,
        event_id:Event.all.sample.id,
        stripe_customer_id:"stripe_customer_id"
    )
    puts "*"*(i+1)
    puts "#{i+1} attendance(s) created"
end