require 'rails_helper'

RSpec.describe "MECHANICS", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create(  name: "Sam Mills",
                                    years_experience: 10)
    @mechanic_2 = Mechanic.create(  name: "Kara Smith",
                                    years_experience: 11)
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
    it "can see their name, years experience, and rides" do
      visit "/mechanics/#{@mechanic_1[:id]}"

      expect(page).to have_content("Mechanic: Sam Mills")
      expect(page).to have_content("Years of Experience: 10")

      visit "/mechanics/#{@mechanic_2[:id]}"

      expect(page).to have_content("Mechanic: Kara Smith")
      expect(page).to have_content("Years of Experience: 11")
    end
  end
end
