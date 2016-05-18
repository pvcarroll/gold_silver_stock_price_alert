class Alert < ApplicationRecord
  QUANDL_API_KEY = 'Rj98VdAhWedxFFbvUCTJ'

  def self.get_gold_silver_data
    require 'quandl'
    Quandl::ApiConfig.api_key = QUANDL_API_KEY
    return  {gold_data: Quandl::Dataset.get('LBMA/GOLD').data.first, silver_data: Quandl::Dataset.get('LBMA/SILVER').data.first}
  end

  def self.check_target_values
    data = self.get_gold_silver_data
    gold_price = data[:gold_data].usd_am
    silver_price = data[:silver_data].usd
    Alert.all.each do |alert|
      price = (alert[:item] == 'gold') ? gold_price : silver_price

      if (alert[:above_or_below] && (price > alert[:target_value])) || (!alert[:above_or_below] && (price < alert[:target_value]))
        PriceAlertMailer.send_alert_email(alert, price).deliver
        alert.destroy!
      end
    end
  end
end