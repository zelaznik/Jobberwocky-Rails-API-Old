class OrderMailer < ActionMailer::Base
  default from: 'info@jobberwocky.net'

  def send_confirmation(order)
    @order = order
    @user = @order.user
    mail to: @user.email, subject: "Order Confirmation"
  end
end
