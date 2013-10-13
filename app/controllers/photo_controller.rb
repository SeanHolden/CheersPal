class PhotoController < ApplicationController
  def create
    puts "IMAGE:"
    puts params
    render json: {"endpoint" => "reached"}
    # uploader = AvatarUploader.new
  end
end
