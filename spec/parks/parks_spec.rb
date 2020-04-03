require 'rails_helper'

RSpec.describe "PARKS", type: :feature do
  before(:each) do
    @park_1 = Park.create(  name: "Hershey Park",
                            admission: 50.0)
    @park_2 = Park.create(  name: "Cedar Point",
                            admission: 65.0)
  end

  describe "Show Page - A user" do
    it "can see a park's name and price" do
      visit "/parks/#{@park_1[:id]}"
      save_and_open_page
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.admission_price)

      visit "/parks/#{@park_2[:id]}"
      expect(page).to have_content(@park_2.name)
      expect(page).to have_content(@park_2.admission_price)
    end
  end

end
