ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

require_relative 'controllers/session_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/request_controller'
require_relative 'controllers/booking_controller'
require_relative 'controllers/space_controller'

require_relative 'rand_bnb_helpers'

class RandBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__

  use Rack::MethodOverride

  register Sinatra::Flash

  helpers Helpers

  get '/' do
    current_user
    if @current_user
      redirect '/dashboard'
    else
      redirect '/signup'
    end
  end

  get '/dashboard' do
    @new_user = session[:new_user]
    session[:search_availability] ||= Date.today
    current_user
    flash_request_check
    if search_availability
      @spaces = Space.all(:available_from.lte => search_availability,
      :available_to.gte => search_availability)
      if @spaces.empty? && @new_user == false
        flash.now[:error] = "Chosen date not available"
      end
    else
      @spaces = Space.all(:available_from.lte => Date.today, :available_to.gte => Date.today)
    end
    erb :dashboard
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
