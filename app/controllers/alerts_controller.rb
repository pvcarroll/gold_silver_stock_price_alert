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
    sp_index_data = data[:sp_index_data]
    @sp_index_open = sp_index_data.open
    @sp_index_close = sp_index_data.close
    puts sp_index_data.inspect
  end

  def create
    @alert = Alert.new alert_params
    if @alert.save
      flash[:notice] = 'Alert saved'
    else
      flash[:failure] = 'Alert NOT saved. All fields are required.'
    end
      redirect_to root_path
  end

  private

    def alert_params
      params.require(:alert).permit(:item, :above_or_below, :target_value, :email)
    end
end