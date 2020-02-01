require_relative( "../models/booking.rb" )
require_relative( "../models/class.rb" )
require_relative( "../models/member.rb" )
require("pry")

Booking.delete_all()
Member.delete_all()
Class.delete_all()

binding.pry
nil
