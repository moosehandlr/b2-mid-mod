require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "instance methods" do
    it "flight_count" do
      @airline = Airline.create(name: "United Airlines")
      @flight1 = @airline.flights.create!(number: "1234")
      @flight2 = @airline.flights.create!(number: "6790")
      @flight3 = @airline.flights.create!(number: "5674")

      @passenger1 = Passenger.create!(name: "Billy Bob", age: 45)

      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight3.id, passenger_id: @passenger1.id)

      expect(@passenger1.flight_count).to eq(3)
    end
  end
end
