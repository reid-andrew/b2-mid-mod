require 'rails_helper'
describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many :ridemechanics}
    it {should have_many :rides}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end
end
