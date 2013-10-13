class PhotoController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    puts "IMAGE:"
    puts params
    # gift = Gift.find(params[:id])
    # gift.update_attributes(claim_time:Time.now, charity:false)
    # 
    uploader = AvatarUploader.new
    uploader.store!(params[:image])
    render json: {"endpoint" => "reached"}
  end
end
