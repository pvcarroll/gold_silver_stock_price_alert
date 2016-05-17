class AlertsController < ApplicationController
  def index
    @alert = Alert.new
    data = Alert.get_gold_silver_data
    gold_data = data[:gold_data]
    @date = gold_data.date
    @gold_am = gold_data.usd_am
    @gold_pm = gold_data.usd_pm
    silver_data = data[:silver_data]
    @silver_price = silver_data.usd
  end

  def create
    @alert = Alert.new alert_params
    if @alert.save
      flash[:notice] = 'alert saved'
      redirect_to root_path
    end
  end

  private

    def alert_params
      params.require(:alert).permit(:item, :above_or_below, :target_value, :email)
    end
end