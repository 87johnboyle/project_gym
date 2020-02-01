require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/session.rb' )
also_reload( '../models/*' )

get '/sessions' do
  erb ( :"sessions/index")
end

get '/sessions/new' do
  erb (:"sessions/new")
end

get '/sessions/:id' do
  erb (:'session/show')
end

get '/sessions/:id/edit' do
  erb (:'session/edit')
end

post '/sessions' do
  session = Session.new(params)
  session.save
  redirect to('/sessions')
end

post '/sessions/:id' do
  session = Session.new(params)
  session.update
  redirect to('/sessions')
end

post '/sessions/:id/delete' do
  Session.delete(params[:id])
redirect to('/sessions')
end
