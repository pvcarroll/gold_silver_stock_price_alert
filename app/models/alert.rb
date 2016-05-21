class Alert < ApplicationRecord
  validates :above_or_below, :target_value, :email, presence: true
  QUANDL_API_KEY = 'Rj98VdAhWedxFFbvUCTJ'

  def self.get_gold_silver_data
    require 'quandl'
    Quandl::ApiConfig.api_key = QUANDL_API_KEY
    return  {
              gold_data: Quandl::Dataset.get('LBMA/GOLD').data.first,
              silver_data: Quandl::Dataset.get('LBMA/SILVER').data.first,
              sp_index_data: Quandl::Dataset.get('YAHOO/INDEX_GSPC').data.first
    }
  end

  def self.check_target_values
    data = self.get_gold_silver_data
    gold_price = data[:gold_data].usd_am
    silver_price = data[:silver_data].usd
    sp_index_open = data[:sp_index_data].open
    Alert.all.each do |alert|
      if alert[:item] == 'sp_index'
        price = sp_index_open
      elsif alert[:item] == 'gold'
        price = gold_price
      elsif alert[:item] == 'silver'
        price = silver_price
      end

      if (alert[:above_or_below] && (price > alert[:target_value])) || (!alert[:above_or_below] && (price < alert[:target_value]))
        PriceAlertMailer.send_alert_email(alert, price).deliver
        alert.destroy!
      end
    end
  end
end