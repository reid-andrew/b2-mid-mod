require 'rails_helper'
describe Ridemechanic, type: :model do
  describe "relationships" do
    it {should belong_to :ride}
    it {should belong_to :mechanic}
  end
end
