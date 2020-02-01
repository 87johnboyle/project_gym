require_relative( "../models/booking.rb" )
require_relative( "../models/class.rb" )
require_relative( "../models/member.rb" )
require("pry")

Booking.delete_all()
Member.delete_all()
Class.delete_all()

class1 = Class.new({
"name" => "Circuits",
"genre" => "High Intensity",
"capacity" => 20
  })

class2 = Class.new({
"name" => "Spin",
"genre" => "Spin Bike",
"Capacity" => 15
  })

class3 = Class.new({
  "name" => "Body Attack",
  "genre" => "Cardio",
  "capacity" => 30
  })

  class1.save
  class2.save
  class3.save

member1 = Member.new({
  "first_name" => "John",
  "last_name" => "Boyle",
  "premium" => "TRUE"
  })

member2 = Member.new({
  "first_name" => "Stephanie",
  "last_name" => "Baird",
  "premium" => "TRUE"
    })

member3 = Member.new({
  "first_name" => "Frank",
  "last_name" => "Hardy",
  "premium" => "FALSE"
  })

member1.save
member2.save
member3.save

booking1 = Booking.new({
"class_id" => class1.id,
"member_id" => member1.id
  })



binding.pry
nil
