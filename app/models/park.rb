class Park < ApplicationRecord
  has_many :rides

  validates_presence_of :name, :admission


  def admission_price
    "$#{sprintf('%.2f', admission)}"
  end

  def average_thrill_rating
    rides.average(:thrill)
  end

  def rides_by_alpha
    rides.order(:name)
  end
end
