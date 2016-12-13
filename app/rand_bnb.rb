ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class RandBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def search_availability
      @search_availability ||= session[:search_availability]
    end
  end

  get '/' do
    erb :signup
  end

  post '/signup' do
    session[:name] = params[:name]
    session[:email] = params[:email]
    session[:password] = params[:password]

    @user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect("/dashboard")
    else
      "YOU SHALL NOT PASS"
      redirect('/')
    end
  end

  get '/dashboard' do
    current_user
    if search_availability
      @spaces = Space.all(:available_from.lte => search_availability,
        :available_to.gte => search_availability)
      if @spaces.empty?
        flash.now[:error] = "Chosen date not available"
      end
    else
      @spaces = Space.all
    end
      erb :dashboard
  end

  get '/sessions/new' do
    erb :signin
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect("/dashboard")
    else
      flash[:error] = "Wrong password"
      redirect('/sessions/new')
    end
  end

  get '/space/new' do
    erb :'space/new_space'
  end

  get '/signin' do
    redirect '/sessions/new'
  end

  post '/space/save' do
    current_user

    @space = Space.new(
      user_id: @current_user.id,
      name: params[:name],
      description: params[:description],
      price_per_night: params[:price_per_night],
      available_from: params[:available_from],
      available_to: params[:available_to])

    avail_from = params[:available_from]
    avail_to = params[:available_to]
    
    if avail_from.empty? || avail_to.empty?
      flash[:error] = "All fields must be completed"
      redirect('/space/new')
    elsif avail_from > avail_to
      flash[:error] = "Cannot have 'to date' before 'from date'"
      redirect('/space/new')
    else
      if @space.save
        redirect('/dashboard')
      else
        flash[:error] = "All fields must be completed"
        redirect('/space/new')
      end
    end
  end

  get '/space/host' do
    current_user
    @spaces = Space.all(user_id: @current_user.id)
    erb :'space/host'
  end

  post '/space/filter' do
    session[:search_availability] = params[:search_availability]
    redirect('/dashboard')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
