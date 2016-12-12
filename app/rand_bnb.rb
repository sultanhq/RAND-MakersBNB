ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class RandBnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :signup
  end

  post '/signup' do
    session[:name] = params[:name]
    session[:email] = params[:email]
    session[:password] = params[:password]

    @user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if @user.save
      @user
      redirect("/dashboard")
    else
      "YOU SHALL NOT PASS"
      redirect('/')
    end
  end

  get '/dashboard' do
    @email = session[:email]
    erb :dashboard
  end

  get '/sessions/new' do
    erb :signin
  end

  post '/sessions' do
    session[:email] = params[:email]
    redirect("/dashboard")
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
