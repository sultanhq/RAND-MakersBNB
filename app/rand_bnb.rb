require 'sinatra/base'

class RandBnb < Sinatra::Base
  get '/' do
    redirect 'signup.html'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
