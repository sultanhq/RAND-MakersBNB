class RandBnb < Sinatra::Base

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:name] = params[:name]
    session[:email] = params[:email]
    session[:password] = params[:password]
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      session[:new_user] = true
      redirect("/dashboard")
    else
      redirect('/signup')
    end
  end

end
