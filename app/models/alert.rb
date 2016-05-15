class Alert < ApplicationRecord

  def get_gold_price
    require 'quandl'
    return  Quandl::Dataset.get('LBMA/GOLD').data.first
  end
end
