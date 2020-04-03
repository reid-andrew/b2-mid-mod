require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many :ridemechanics}
    it {should have_many :rides}
  end
end
