class RandBnb < Sinatra::Base

  get '/space/new' do
    erb :'space/new_space'
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
        redirect('/space/host')
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

  post '/space/edit' do
    session[:space_id] = params[:id]
    redirect('space/update')
  end

  get '/space/update' do
    @space = Space.get(session[:space_id])
    erb :'space/update'
  end

  post '/space/update' do
    @space = Space.get(session[:space_id])

    avail_from = params[:available_from]
    avail_to = params[:available_to]

    if avail_from.empty? || avail_to.empty?
      flash[:error] = "All fields must be completed"
      redirect('/space/update')
    elsif avail_from > avail_to
      flash[:error] = "Cannot have 'to date' before 'from date'"
      redirect('/space/update')
    else
      current_user
      if @space.update(
                      user_id: @current_user.id,
                      name: params[:name],
                      description: params[:description],
                      price_per_night: params[:price_per_night],
                      available_from: params[:available_from],
                      available_to: params[:available_to])
        redirect('/space/host')
      else
        flash[:error] = "All fields must be completed"
        redirect('/space/update')
      end
    end
  end

  post '/space/filter' do
    session[:search_availability] = params[:search_availability]
    redirect('/dashboard')
  end

end
