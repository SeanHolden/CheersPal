class GiftsController < ApplicationController
  protect_from_forgery except: [:index, :create]

  def index
    render json: [{sender:"aaa", receiver: "bbb", amount: "400", title:"beer", charity:"false", sent_time:"1381602027", claim_time:""}]
  end

  def create
    # puts "PARAMS ->"
    # puts params.except(:action, :controller)
    # params[:charity] = to_boolean(params[:charity])
    # params[:sent_time] = Time.at(params[:sent_time].to_i)
    # gift = Gift.new(params.except(:action, :controller))
    # if gift.save
    #   render json: {"success" => "Data was saved."}
    # else
    #   render json: {"error" => "Something went wrong. Data not saved. Check params are correct format."}
    # end
  end

  private

  def to_boolean(str)
    str == 'true'
  end

end
