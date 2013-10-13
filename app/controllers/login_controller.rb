class LoginController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    puts "PARAMS ..."
    puts params
    puts "...END OF PARAMS"
    email = params[:email].downcase
    firstname = params[:firstname].downcase
    lastname = params[:lastname].downcase
    user = User.find_or_create_by(email:email, firstname:firstname, lastname:lastname)
    sender_gifts = Gift.where(sender_id:user.email)
    receiver_gifts = Gift.where(receiver_id:user.email)
    render 'gifts/show.json'
  end
end
