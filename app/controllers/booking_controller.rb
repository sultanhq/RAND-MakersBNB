class RandBnb < Sinatra::Base

  get '/bookings' do
    @bookings_made = Booking.all(user_id: current_user.id)
    @my_spaces = []
    Space.all(user_id: current_user.id).each do |space|
      if space.user_id = current_user.id
        @my_spaces << space.id
      end
    end
    @all_bookings = Booking.all
    erb :'booking/bookings'
  end

  post '/booking_accept' do
    booking = Booking.all(id: params[:id])
    booking.update(:booking_confirmed => true)
    redirect '/dashboard'
  end

  post '/booking_reject' do
    booking = Booking.all(id: params[:id])
    booking.destroy
    redirect '/dashboard'
  end

end
