class FlightsController < ApplicationController
  before_action :set_flight

  def index
    @flights = Flight.all

    @flight_search_results = Flight.where(departure_airport: Airport.where(code: params[:departure_code]).first, arrival_airport: Airport.where(code: params[:arrival_code]).first).where("start LIKE ?", "#{params[:flight_date]}%")
    @passenger_num = params[:passenger_num]
  end

  def new
    
  end

  def create
    
  end

  def set_flight
    
  end
end
