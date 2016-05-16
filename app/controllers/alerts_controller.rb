class AlertsController < ApplicationController
  def index
    @alert = Alert.new
    data = @alert.get_gold_silver_data
    gold_data = data[:gold_data]
    @date = gold_data.date
    @gold_am = gold_data.usd_am
    @gold_pm = gold_data.usd_pm
    silver_data = data[:silver_data]
    @silver_price = silver_data.usd
  end

  def create
  end
end
