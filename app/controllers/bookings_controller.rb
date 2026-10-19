class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight].to_i)
    @booking = Booking.new

    @passenger_num = params[:passenger_num].to_i
    return head :not_found unless (1..4).cover?(@passenger_num)

    @passenger_num.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Flight successfully booked." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.expect(booking: [ :flight_id, passengers_attributes: [ [ :name, :email ] ] ])
  end
end
