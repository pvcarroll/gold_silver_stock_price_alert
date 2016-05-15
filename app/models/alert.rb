class Alert < ApplicationRecord
  QUANDL_API_KEY = 'Rj98VdAhWedxFFbvUCTJ'

  def get_gold_price
    require 'quandl'
    Quandl::ApiConfig.api_key = QUANDL_API_KEY
    return  Quandl::Dataset.get('LBMA/GOLD').data.first
  end

  def get_silver_price
    require 'quandl'
    Quandl::ApiConfig.api_key = QUANDL_API_KEY
    return Quandl::Dataset.get('LBMA/SILVER').data.first
  end
end
