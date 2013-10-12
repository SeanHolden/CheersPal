class LoginController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    email = params[:email].downcase
    firstname = params[:firstname].downcase
    lastname = params[:lastname].downcase
    user = User.find_or_create_by(email:email, firstname:firstname, lastname:lastname)
    @gifts = user.gifts
    render 'gifts/show.json'
  end
end
