require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/session.rb' )
also_reload( '../models/*' )

get '/sessions' do
  @sessions = Session.all()
  erb ( :"sessions/index")
end

get '/sessions/new' do
  @sessions = Session.all
  erb (:"sessions/new")
end

get '/sessions/:id' do
  @session = Session.find(params[:id])
  erb (:'sessions/show')
end

get '/sessions/:id/edit' do
  @session = Session.find(params[:id])
  erb (:'sessions/edit')
end

post '/sessions' do
  session = Session.new(params)
  session.save
  redirect to '/sessions'
end

post '/sessions/:id' do
  session = Session.new(params)
  session.update
  redirect to '/sessions'
end

post '/sessions/:id/delete' do
  Session.delete(params[:id])
redirect to '/sessions'
end
