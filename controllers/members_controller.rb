require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/members' do
  erb (:"members/index")
end

get '/members/:id' do
  erb ( :"members/show" )
end


get '/members/new' do
  erb (:"members/new")
end

get '/members/:id/edit' do
  erb (:'members/edit')
end

post '/members' do
  member = Member.new(params)
  member.save
  redirect to('/members')
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to('/members')
end

post '/members/:id/delete' do
  Member.delete(params[:id])
redirect to('/members')
end
