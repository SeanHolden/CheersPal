class PayController < ApplicationController
  protect_from_forgery except: [:create]

  def get_access_token

  end

  def create
    token = HTTParty.post('https://api.sandbox.paypal.com/v1/oauth2/token',
              :basic_auth => {:username => ENV['paypal_client_id'], :password => ENV['paypal_client_secret']},
              :headers => {"Accept" => "application/json",
                           "Accept-Language" => "en_US"},
              :body    => {"grant_type"=>"client_credentials"})
    
    access_token = token["access_token"]

    puts "ACCESS_TOKEN -> #{access_token}"

    result = HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment",
      :headers => {"Content-Type" => "application/json",
                   "Authorization" => "Bearer #{access_token}"},
      :body => {"intent" => "sale",
                "redirect_urls" => {
                  "return_url" => "http://localhost:3000",
                  "cancel_url" => "http://localhost:3000"
                  },
                "payer" => {
                  "payment_method" => "paypal"
                  },
                "transactions" => [
                  {
                    "amount" => {
                      "total" => "4.13",
                      "currency" => "GBP"
                    }
                  }
                ]
              }.to_json)
    url = ""
    result["links"].each do |link|
      if link["rel"] == "approval_url"
        url = link["href"]
      end
    end

    render json: {"url"=>url}
    
  end
end


# -d '{
#   "intent":"sale",
#   "redirect_urls":{
#     "return_url":"http://example.com/your_redirect_url/",
#     "cancel_url":"http://example.com/your_cancel_url/"
#   },
#   "payer":{
#     "payment_method":"paypal"
#   },
#   "transactions":[
#     {
#       "amount":{
#         "total":"7.47",
#         "currency":"USD"
#       }
#     }
#   ]
# }'

# curl https://api.sandbox.paypal.com/v1/oauth2/token \
#  -H "Accept: application/json" \
#  -H "Accept-Language: en_US" \
#  -u "EOJ2S-Z6OoN_le_KS1d75wsZ6y0SFdVsY9183IvxFyZp:EClusMEUk8e9ihI7ZdVLF5cZ6y0SFdVsY9183IvxFyZp" \
#  -d "grant_type=client_credentials"


# @result = HTTParty.post(@urlstring_to_post.to_str, 
#     :body => { :subject => 'This is the screen name', 
#                :issue_type => 'Application Problem', 
#                :status => 'Open', 
#                :priority => 'Normal', 
#                :description => 'This is the description for the problem'
#              }.to_json,
#     :headers => { 'Content-Type' => 'application/json' } )