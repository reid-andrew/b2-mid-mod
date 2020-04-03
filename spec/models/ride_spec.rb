require 'rails_helper'

describe Ride, type: :model do
  describe "relationships" do
    it {should belong_to :park}
    it {should have_many :ridemechanics}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :thrill}
    it {should validate_presence_of :park}
  end

end
