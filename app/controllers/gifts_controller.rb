class GiftsController < ApplicationController
  protect_from_forgery except: [:index, :create, :destroy, :show]

  def index
    # @gifts = Gift.all
    # render 'index.json'
  end

  def show
    id = params[:id]
    @gifts = Gift.where("receiver_id = ? OR sender_id = ?", id, id)
    render 'show.json'
  end

  def create
    user = User.find_by(email: params[:sender_id])
    if user
      gift = user.gifts.new(receiver_id:params[:receiver_id],
                            amount: params[:amount],
                            title: params[:title],
                            sent_time: Time.now.to_i)
      if gift.save
        render json: {"success" => "gift was created"}
      else
        render json: {"error" => "gift was not created. double check params are correct."}
      end
    else
      render json: {"error" => "user not found"}
    end
  end

  def destroy
    gift = Gift.find(params[:id])
    if Gift.exists?(gift)
      gift.destroy
      render json: {"success" => "Gift destroyed"}
    else
      render json: {"error" => "Gift with id #{params[:id]} does not exist"}
    end
  end

  private

  def to_boolean(str)
    str == 'true'
  end

end
