# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@airline1 = Airline.create(name: "United Airlines")
@flight1 = @airline1.flights.create!(number: "12345")
@flight2 = @airline1.flights.create!(number: "67890")

@airline2 = Airline.create(name: "Delta Airlines")
@flight3 = @airline2.flights.create!(number: "432")
@flight4 = @airline2.flights.create!(number: "789")

@passenger1 = Passenger.create!(name: "Billy Bob", age: 45)
@passenger2 = Passenger.create!(name: "John Doe", age: 22)
@passenger3 = Passenger.create!(name: "Jane Doe", age: 20)
@passenger4 = Passenger.create!(name: "Chris Williams", age: 34)
@passenger5 = Passenger.create!(name: "Richard Johnson", age: 65)
@passenger6 = Passenger.create!(name: "Hank Williams", age: 12)
@passenger7 = Passenger.create!(name: "John Meyers", age: 37)

#United
FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger2.id)
FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger2.id)
FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger3.id)
FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger4.id)
FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger6.id)
FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger7.id)

#Delta
FlightPassenger.create(flight_id: @flight3.id, passenger_id: @passenger5.id)
FlightPassenger.create(flight_id: @flight3.id, passenger_id: @passenger6.id)
FlightPassenger.create(flight_id: @flight4.id, passenger_id: @passenger6.id)
FlightPassenger.create(flight_id: @flight4.id, passenger_id: @passenger7.id)
FlightPassenger.create(flight_id: @flight3.id, passenger_id: @passenger1.id)
FlightPassenger.create(flight_id: @flight4.id, passenger_id: @passenger2.id)
