require 'rails_helper'

RSpec.describe "Flights Index Page" do
  before :each do
    @airline = Airline.create(name: "United Airlines")
    @flight1 = @airline.flights.create!(number: "12345")
    @flight2 = @airline.flights.create!(number: "67890")
    @passenger1 = Passenger.create!(name: "Billy Bob", age: 45)
    @passenger2 = Passenger.create!(name: "John Doe", age: 22)
    @passenger3 = Passenger.create!(name: "Jane Doe", age: 20)
    @passenger4 = Passenger.create!(name: "Chris Williams", age: 34)
    @passenger5 = Passenger.create!(name: "Richard Johnson", age: 65)

    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger1.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger2.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger3.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @passenger4.id)

    FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger4.id)
    FlightPassenger.create(flight_id: @flight2.id, passenger_id: @passenger5.id)
  end

  it "I see a list of flights with a list of passengers for each flight" do
    visit "/flights"


    within "#flight-#{@flight1.id}" do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end

    within "#flight-#{@flight2.id}" do
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@passenger4.name)
      expect(page).to have_content(@passenger5.name)
    end
  end

  it "I Can Remove a Passenger from a Flight" do
    visit "/flights"

    within "#passenger-#{@passenger1.id}" do
      expect(page).to have_button("Remove Passenger")
    end

    within "#passenger-#{@passenger2.id}" do
      expect(page).to have_button("Remove Passenger")
    end

    within "#flight-#{@flight1.id}" do
      within "#passenger-#{@passenger4.id}" do
        expect(page).to have_button("Remove Passenger")
        click_button "Remove Passenger"
      end
    end

    expect(current_path).to eq("/flights")

    within "#flight-#{@flight1.id}" do
      expect(page).to_not have_content(@passenger4.name)
    end

    within "#flight-#{@flight2.id}" do
      expect(page).to have_content(@passenger4.name)
    end
  end
end
