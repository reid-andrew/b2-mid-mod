require 'rails_helper'

RSpec.describe "MECHANICS", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create(  name: "Sam Mills",
                                    years_experience: 10)
    @mechanic_2 = Mechanic.create(  name: "Kara Smith",
                                    years_experience: 11)
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
    @ride_3 = Ride.create(  name: "Blue Streak",
                            thrill: 7.0,
                            park: @park_2)
    @ride_4 = Ride.create(  name: "Magnum",
                            thrill: 7.0,
                            park: @park_2)
    Ridemechanic.create(    mechanic: @mechanic_1,
                            ride: @ride_1)
    Ridemechanic.create(    mechanic: @mechanic_1,
                            ride: @ride_2)
    Ridemechanic.create(    mechanic: @mechanic_1,
                            ride: @ride_3)
    Ridemechanic.create(    mechanic: @mechanic_2,
                            ride: @ride_4)
  end

  describe "Index Page - A user" do
    it "can see all mechanics with their years of experience" do
      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
      within ("#Mechanic-#{@mechanic_1.id}") do
        expect(page).to have_content("Sam Mills - 10 years of experience")
      end
      within ("#Mechanic-#{@mechanic_2.id}") do
        expect(page).to have_content("Kara Smith - 11 years of experience")
      end
    end
  end

  describe "Show Page - A user" do
    it "can see their name & years experience" do
      visit "/mechanics/#{@mechanic_1[:id]}"

      expect(page).to have_content("Mechanic: Sam Mills")
      expect(page).to have_content("Years of Experience: 10")

      visit "/mechanics/#{@mechanic_2[:id]}"

      expect(page).to have_content("Mechanic: Kara Smith")
      expect(page).to have_content("Years of Experience: 11")
    end

    it "can see their rides worked on" do
      visit "/mechanics/#{@mechanic_1[:id]}"

      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_3.name)
      expect(page).to_not have_content(@ride_4.name)

      visit "/mechanics/#{@mechanic_2[:id]}"
      expect(page).to_not have_content(@ride_1.name)
      expect(page).to_not have_content(@ride_2.name)
      expect(page).to_not have_content(@ride_3.name)
      expect(page).to have_content(@ride_4.name)
    end

    it "can add rides to their worklist" do
      visit "/mechanics/#{@mechanic_2.id}"

      fill_in(:ride, :with => "#{@ride_1.id}")
      click_button('Submit')
      fill_in(:ride, :with => "#{@ride_2.id}")
      click_button('Submit')

      expect(page).to have_current_path("/mechanics/#{@mechanic_2.id}")
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to_not have_content(@ride_3.name)
      expect(page).to have_content(@ride_4.name)
    end
  end
end
