class PriceAlertMailer < ApplicationMailer

  def send_alert_email(alert, price)
    @alert = alert
    @price = price
    if !alert.email.empty?
      mail( :to => @alert.email,
          :subject => 'Price alert' )
    end
  end
end
