class UsersController < ApplicationController
  def index
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: {"error" => "user does not exist"}
    else
      render json: user
    end
  end
end
