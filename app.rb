require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bookings_controller')
require_relative('controllers/sessions_controller')
require_relative('controllers/members_controller')

get '/' do
  erb ( :home )
end
