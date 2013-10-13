class PayController < ApplicationController
  def create
    require 'paypal-sdk-adaptivepayments'
    @api = PayPal::SDK::AdaptivePayments::API.new

    # Build request object
    @pay = @api.build_pay({
      :actionType => "PAY",
      :cancelUrl => "http://cheerspal.herokuapp.com/cancelpayment",
      :currencyCode => "GBP",
      :feesPayer => "SENDER",
      :ipnNotificationUrl => "http://cheerspal.herokuapp.com/ipn_notify",
      :receiverList => {
        :receiver => [{
          :amount => 1.0,
          :email => "seanholden1@gmail.com" }] },
      :returnUrl => "http://cheerspal.herokuapp.com/pay_return_url",
      :sender => {
        :email => params[:email],
        :useCredentials => true } })

    # Make API call & get response
    @pay_response = @api.pay(@pay)

    # Access Response
    if @pay_response.success?
      @pay_response.payKey
      @pay_response.paymentExecStatus
      @pay_response.payErrorList
      @pay_response.paymentInfoList
      @pay_response.sender
      @pay_response.defaultFundingPlan
      @pay_response.warningDataList
    else
      @pay_response.error
    end
  end
end
