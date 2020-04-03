class Ride < ApplicationRecord
  belongs_to :park
  has_many :ridemechanics

  validates_presence_of :name, :thrill, :park
end
