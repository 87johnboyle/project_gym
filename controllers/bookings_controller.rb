require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/session.rb')
also_reload( '../models/*' )
require('pry')

get '/bookings' do
  @bookings = Booking.all()
  erb ( :"bookings/index")
end

get '/sessions/:id/bookings' do
  @sessions = Session.find(params[:id])
  @members = @sessions.booked_members()
  @bookings = Booking.all()
  # binding.pry
  erb (:'sessions/bookings')
end

get '/sessions/:id/new_booking' do
  @members = Member.all
  @session_id = params[:id]
  @attending = Session.find(params[:id]).booked_members.map {|member| member.id}
  erb (:'bookings/new')
end

get '/members/:id/bookings' do
  @members = Member.find(params[:id])
  @sessions = @members.booked_sessions()
  erb (:'members/bookings')
end

post '/sessions/:session_id/bookings' do
  booking = Booking.new(params)
  booking.save
  session = Session.find(params['session_id'])
  session.reduce_capacity
  session.update
  redirect to "/sessions"
end

post '/bookings/:id/delete' do
  sessioninfo = Booking.find(params[:id])
  session = sessioninfo.sessions
  session.increase_capacity
  session.update
  Booking.delete(params[:id])
  redirect to "/sessions"
end
