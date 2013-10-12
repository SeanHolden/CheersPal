class LoginController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    email = params[:email]
    firstname = params[:firstname]
    lastname = params[:lastname]
    user = User.find_or_create_by(email:email, firstname:firstname, lastname:lastname)
    session[:user_email] = user.email
    current_user = user
    @gifts = user.gifts
    render 'gifts/show.json'
  end

  def destroy
    session[:user_email] = nil
    current_user = nil
  end
end
