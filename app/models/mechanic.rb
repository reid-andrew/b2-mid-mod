class Mechanic < ApplicationRecord
  has_many :ridemechanics
  has_many :rides, through: :ridemechanics
  validates_presence_of :name, :years_experience
end
