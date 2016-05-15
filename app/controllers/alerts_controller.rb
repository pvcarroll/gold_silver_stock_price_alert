class AlertsController < ApplicationController
  def index
    @alert = Alert.new
    @alert.get_gold_price
  end

  def create
  end
end
