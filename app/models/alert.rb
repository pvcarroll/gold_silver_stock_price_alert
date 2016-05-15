class Alert < ApplicationRecord

  def get_gold_price
    require 'quandl'
    puts Quandl::Dataset.get('WIKI/AAPL')
  end
end
