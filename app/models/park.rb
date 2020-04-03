class Park < ApplicationRecord

  def admission_price
    "$#{sprintf('%.2f', admission)}"
  end
end
