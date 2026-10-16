class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight].to_i)
    @booking = Booking.new

    passenger_num = params[:passenger_num].to_i
    return head :not_found unless (1..4).cover?(passenger_num)

    passenger_num.times do
      @passengers << Passenger.new
    end
  end

  def create
    
  end
end
