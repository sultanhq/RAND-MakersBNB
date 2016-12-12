require 'sinatra/base'

class RandBnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :signup
  end

  post '/signup' do
  session[:name] = params[:name]
  session[:email] = params[:email]
  session[:password] = params[:password]
  redirect("/dashboard")
  end

  get '/dashboard' do
    @name = session[:name]
    erb :dashboard
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
