class PriceAlertMailer < ApplicationMailer

  def send_alert_email(alert)
    @alert = alert
    puts "ALERT.EMAIL #{alert.email}"
    if !alert.email.empty?
      mail( :to => @alert.email,
          :subject => 'Thanks for signing up for our amazing app' )
    end
  end
end
