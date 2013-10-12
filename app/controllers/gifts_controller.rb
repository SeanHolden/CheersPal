class GiftsController < ApplicationController
  protect_from_forgery except: [:index, :create, :destroy]

  def index
    # render json: [{id:1, sender:"aaa", receiver: "bbb", amount: 400, title:"beer", charity:"false", sent_time:1381602027, claim_time:nil}]
    @gifts = Gift.all
    render 'index.json'
  end

  def create
    sender = params[:sender]
    receiver = params[:sender]
    amount = params[:amount]
    title = params[:title]
    charity = to_boolean(params[:charity])
    sent_time = Time.at(params[:sent_time].to_i)
    gift = Gift.new(sender:sender,receiver:receiver,amount:amount,title:title,charity:charity,sent_time:sent_time)
    if gift.save
      render json: {"success" => "Data was saved."}
    else
      render json: {"error" => "Something went wrong. Data not saved. Check params are correct format."}
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
