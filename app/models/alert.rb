class Alert < ApplicationRecord
  validates :target_value, :email, presence: true
  validates :stock, presence: true, if: :item_is_stock?
  require 'quandl'
  Quandl::ApiConfig.api_key = 'Rj98VdAhWedxFFbvUCTJ'

  def self.check_target_values
    data = self.get_gold_silver_stock_data
    gold_price = data[:gold_data].usd_am
    silver_price = data[:silver_data].usd
    sp_index_open = data[:sp_index_data].open
    Alert.all.each do |alert|
      puts "ITEM: #{alert[:item]}"
      if alert[:item] == 'stock'
        price = self.get_stock_price alert[:stock].split(',')[0]
      elsif alert[:item] == 'sp_index'
        price = sp_index_open
      elsif alert[:item] == 'gold'
        price = gold_price
      elsif alert[:item] == 'silver'
        price = silver_price
      end
      puts "PRICE: #{price}"
      puts !price.blank?
      puts (alert[:above_or_below] && (price > alert[:target_value])) || (!alert[:above_or_below] && (price < alert[:target_value]))
      if (!price.blank?) && (alert[:above_or_below] && (price > alert[:target_value])) || (!alert[:above_or_below] && (price < alert[:target_value]))
        puts 'BEFORE MAILER'
        PriceAlertMailer.send_alert_email(alert, price).deliver
        puts 'AFTER MAILER'
        alert.destroy!
      end
    end
  end

  def self.get_stock_price(stock)
    Quandl::Dataset.get(stock).data(params: { limit: 1 }).first.open
  end

  def self.get_gold_silver_stock_data
    return  {
              gold_data: Quandl::Dataset.get('LBMA/GOLD').data(params: { limit: 1 }).first,
              silver_data: Quandl::Dataset.get('LBMA/SILVER').data(params: { limit: 1 }).first,
              sp_index_data: Quandl::Dataset.get('YAHOO/INDEX_GSPC').data(params: { limit: 1 }).first
    }
  end

  private

  def item_is_stock?
    self.item == 'stock'
  end
end
