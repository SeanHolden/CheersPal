class PhotoController < ApplicationController
  protect_from_forgery except: [:create]
  
  def create
    puts "IMAGE:"
    puts params
    render json: {"endpoint" => "reached"}
    # uploader = AvatarUploader.new
  end
end
