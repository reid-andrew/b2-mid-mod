require 'rails_helper'

describe Park, type: :model do
  describe "relationships" do
    it {should have_many :rides}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :admission}
  end

  describe "methods" do
    describe "#admission_price" do
      it "can format admission price for presentation" do
        park_1 = Park.create( name: "Cedar Point",
                              admission: 65.0)
        expect(park_1.admission_price).to eq("$65.00")


        park_2 = Park.create( name: "King's Island",
                              admission: 50.499999)
        expect(park_2.admission_price).to eq("$50.50")
      end
    end

    describe "#average_thrill_rating" do
      it "can calculate average thrill rating" do
        park_1 = Park.create(  name: "Hershey Park",
                                admission: 50.0)

        Ride.create(  name: "The Great Bear",
                      thrill: 4.0,
                      park: park_1)
        Ride.create(  name: "Lightning Racer",
                      thrill: 5.0,
                      park: park_1)
        Ride.create(  name: "Storm Runner",
                      thrill: 6.0,
                      park: park_1)

        expect(park_1.average_thrill_rating).to eq(5.0)
      end
    end

    describe "#rides_by_alpha" do
      it "can sort rides alphabetically" do
        park_1 = Park.create(  name: "Hershey Park",
                                admission: 50.0)

        ride_1 = Ride.create(  name: "XYZ",
                      thrill: 4.0,
                      park: park_1)
        ride_2 = Ride.create(  name: "ABC",
                      thrill: 5.0,
                      park: park_1)
        ride_3 = Ride.create(  name: "LMN",
                      thrill: 6.0,
                      park: park_1)


        expect(park_1.rides_by_alpha).to eq([ride_2, ride_3, ride_1])    
      end
    end
  end

end
