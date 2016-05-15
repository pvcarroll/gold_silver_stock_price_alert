class AlertsController < ApplicationController
  def index
    @alert = Alert.new
    gold_data = @alert.get_gold_price
    @date = gold_data.date
    @gold_am = gold_data.usd_am
    @gold_pm = gold_data.usd_pm
    silver_data = @alert.get_silver_price
    @silver_price = silver_data.usd
  end

  def create
  end
end
