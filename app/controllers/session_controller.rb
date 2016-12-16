class RandBnb < Sinatra::Base

  get '/signin' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :signin
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:new_user] = false
      redirect("/dashboard")
    else
      flash[:error] = "Wrong password"
      redirect('/sessions/new')
    end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = "Thank you for using RAND-bnb, see you again soon!"
    redirect ('/sessions/new')
  end

end
