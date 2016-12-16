module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def search_availability
    @search_availability ||= session[:search_availability]
  end

  def flash_request_check
    result = Booking.all(booking_confirmed: false)
    result.each do |booking|
      if (Space.get(booking.space_id).user_id == current_user.id)
        flash[:booking] = "You have unconfirmed bookings"
      end
    end
  end

end
