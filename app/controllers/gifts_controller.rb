class GiftsController < ApplicationController
  protect_from_forgery except: [:index, :create, :destroy, :show]

  def index
    # @gifts = Gift.all
    # render 'index.json'
  end

  def show
    id = params[:id]
    sender_gifts = Gift.where(sender_id: id)
    receiver_gifts = Gift.where(receiver_id: id)
    @gifts = sender_gifts + receiver_gifts
    render 'show.json'
  end

  def create
    user = User.find_by(email: params[:sender_id])
    if user
      gift = Gift.new(sender_id: params[:sender_id],
                      receiver_id:params[:receiver_id],
                      amount: params[:amount],
                      title: params[:title],
                      sent_time: Time.at( params[:sent_time].to_i ) )
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
