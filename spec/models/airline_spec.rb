require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it {should have_many :flights}
  end

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "instance methods" do
    it "unique_passengers" do
      @airline1 = Airline.create(name: "United Airlines")
      @flight1 = @airline1.flights.create!(number: "12345")
      @flight2 = @airline1.flights.create!(number: "67890")

      @passenger1 = Passenger.create!(name: "Billy Bob", age: 45)
      @passenger2 = Passenger.create!(name: "John Doe", age: 22)
      @passenger3 = Passenger.create!(name: "Jane Doe", age: 20)
      @passenger4 = Passenger.create!(name: "Chris Williams", age: 34)

      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger2.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger4.id)
      FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger2.id)
      FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger3.id)
      FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger4.id)

      expect(@airline1.unique_passengers).to eq([@passenger1.name, @passenger4.name, @passenger3.name, @passenger2.name])
    end
  end
end
