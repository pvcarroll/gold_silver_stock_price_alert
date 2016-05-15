class AlertsController < ApplicationController
  def index
    @alert = Alert.new
    gold_data = @alert.get_gold_price
    puts gold_data.date, gold_data.usd_am, gold_data.usd_pm
  end

  def create
  end
end
