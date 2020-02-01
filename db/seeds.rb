require_relative( "../models/booking.rb" )
require_relative( "../models/class.rb" )
require_relative( "../models/member.rb" )
# require ('pry')

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
  "capacity" => 15
})

class3 = Class.new({
  "name" => "Body Attack",
  "genre" => "Cardio",
  "capacity" => 30
})

  class1.save
  class2.save
  class3.save

  class2.capacity = 20
  class2.update

member1 = Member.new({
  "first_name" => "John",
  "last_name" => "Boyle",
  "premium" => true
  })

member2 = Member.new({
  "first_name" => "Stephanie",
  "last_name" => "Baird",
  "premium" => true
  })

member3 = Member.new({
  "first_name" => "Frank",
  "last_name" => "Hardy",
  "premium" => false
})

  member1.save
  member2.save
  member3.save

  member2.last_name = "Boyle"
  member2.update

booking1 = Booking.new({
  "class_id" => class1.id,
  "member_id" => member1.id
})
booking2 = Booking.new({
  "class_id" => class1.id,
  "member_id" => member2.id
})

booking1.save
booking2.save
booking2.class_id = class2.id
booking2.update

# binding.pry
nil
