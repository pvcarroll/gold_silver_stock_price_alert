class Alert < ApplicationRecord
  QUANDL_API_KEY = 'Rj98VdAhWedxFFbvUCTJ'

  def get_gold_silver_data
    require 'quandl'
    Quandl::ApiConfig.api_key = QUANDL_API_KEY
    return  {gold_data: Quandl::Dataset.get('LBMA/GOLD').data.first, silver_data: Quandl::Dataset.get('LBMA/SILVER').data.first}
  end
end
