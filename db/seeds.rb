require_relative( "../models/booking.rb" )
require_relative( "../models/session.rb" )
require_relative( "../models/member.rb" )
require ('pry')

Booking.delete_all()
Member.delete_all()
Session.delete_all()

session1 = Session.new({
  "name" => "Circuits",
  "genre" => "High Intensity",
  "capacity" => 20,
  "session_time" => "07:00:00",
  "session_date" => "2020/03/04"
})

session2 = Session.new({
  "name" => "Spin",
  "genre" => "Spin Bike",
  "capacity" => 15,
  "session_time" => "09:00:00",
  "session_date" => "2020/03/04"
})

session3 = Session.new({
  "name" => "Body Attack",
  "genre" => "Cardio",
  "capacity" => 30,
  "session_time" => "18:00:00",
  "session_date" => "2020/03/04"
})

  session1.save
  session2.save
  session3.save

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
  "session_id" => session1.id,
  "member_id" => member1.id
})
booking2 = Booking.new({
  "session_id" => session1.id,
  "member_id" => member2.id
})

booking1.save
booking2.save
booking2.session_id = session2.id
booking2.update

binding.pry
nil
