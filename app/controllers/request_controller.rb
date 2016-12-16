class RandBnb < Sinatra::Base

  post '/request' do
    flash[:notice] = "Request sent to space owner"
    search_availability
    @booking = Booking.create(
    user_id: current_user.id,
    space_id: params[:requested_space_id],
    booking_date: @search_availability)
    redirect('/dashboard')
  end

  get '/requests' do
    @requests_made = Booking.all(user_id: current_user.id)
    @my_spaces = []
    Space.all(user_id: current_user.id).each do |space|
      if space.user_id = current_user.id
        @my_spaces << space.id
      end
    end
    @all_requests = Booking.all
    erb :'request/requests'
  end
  
end
