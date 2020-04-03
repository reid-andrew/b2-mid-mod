require 'rails_helper'

RSpec.describe "PARKS", type: :feature do
  before(:each) do
    @park_1 = Park.create(  name: "Hershey Park",
                            admission: 50.0)
    @park_2 = Park.create(  name: "Cedar Point",
                            admission: 65.0)

    @ride_1 = Ride.create(  name: "The Great Bear",
                            thrill: 6.4,
                            park: @park_1)
    @ride_2 = Ride.create(  name: "Lightning Racer",
                            thrill: 10.0,
                            park: @park_1)
    @ride_3 = Ride.create(  name: "Storm Runner",
                            thrill: 7.0,
                            park: @park_1)

  end

  describe "Show Page - A user" do
    it "can see a park's name and price" do
      visit "/parks/#{@park_1[:id]}"
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.admission_price)

      visit "/parks/#{@park_2[:id]}"
      expect(page).to have_content(@park_2.name)
      expect(page).to have_content(@park_2.admission_price)
    end

    it "can see a park's rides" do
      visit "/parks/#{@park_1[:id]}"
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_3.name)
      expect(page).to have_content(@park_1.average_thrill_rating)
      expect(page.text.index(@ride_2.name)).to be < page.text.index(@ride_3.name)
      expect(page.text.index(@ride_3.name)).to be < page.text.index(@ride_1.name)
      save_and_open_page
    end
  end

end
