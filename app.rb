require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bookings_controller')
require_relative('controllers/sessions_controller')
require_relative('controllers/members_controller')

get '/' do
  erb ( :home )
end

get '/search/:name' do
  @results = Session.all.where("name LIKE ?", "%#{params[:name]}%").reverse_order(:id)
  erb ( :search )
end
