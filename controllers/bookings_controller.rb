require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
require_relative('../models/member.rb')
require_relative('../models/session.rb')
also_reload( '../models/*' )

get '/booking' do
  @bookings = Booking.all()
  erb ( :"booking/index")
end

get '/sessions/:id/bookings' do
  @session = Session.find(params[:id])
  @members = @session.members()
  erb (:"sessions/bookings")
end

get '/sessions/:id/new_booking' do
  @members = Member.all
  @session_id = params[:id]
  @attending = Session.find(params[:id]).members.map {|member| member.id}
  erb (:'booking/new')
end

get '/members/:id/bookings' do
  @members = Member.find(params[:id])
  @sessions = @members.booked_sessions()
  erb (:'member/bookings')
end

post '/sessions/:session_id/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to('/sessions/#{params['session_id']}/bookings')
end

post '/members/:member_id/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to('/members/#{params['session_id']}/bookings')
end
