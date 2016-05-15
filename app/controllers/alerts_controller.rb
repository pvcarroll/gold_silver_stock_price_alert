class AlertsController < ApplicationController
  def index
    @alert = Alert.new
  end

  def create
  end
end
