# User Story 4, Passengers Index Page
# As a visitor
# When I visit a passengers index page ('/passengers')
# I see names of all passengers
# And next to the passengers name, I see the number of flights that the passenger has

require 'rails_helper'

RSpec.describe "Passengers Index Page" do
  before :each do
    @airline = Airline.create(name: "United Airlines")
    @flight1 = @airline.flights.create!(number: "1234")
    @flight2 = @airline.flights.create!(number: "6790")
    @flight3 = @airline.flights.create!(number: "5674")

    @passenger1 = Passenger.create!(name: "Billy Bob", age: 45)
    @passenger2 = Passenger.create!(name: "John Doe", age: 22)

    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
    FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger1.id)
    FlightPassenger.create(flight_id: @flight3.id, passenger_id: @passenger1.id)

    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger2.id)
    FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger2.id)
  end

  it "I see names of all passengers and the number of flights that the passenger has" do
    visit "/passengers"

    within "#passenger-#{@passenger1.id}" do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content("Flight Count: 3")
    end

    within "#passenger-#{@passenger2.id}" do
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content("Flight Count: 2")
    end
  end
end
