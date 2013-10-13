class PhotoController < ApplicationController
  protect_from_forgery except: [:create]

  def create
    puts "IMAGE:"
    puts params
    gift = Gift.find(params[:id])
    unless gift.nil?
      gift.update_attributes(claim_time:Time.now, charity:false)
    end
    
    @s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    )

    bucket = @s3.buckets['cheerspal']
    obj = bucket.objects[ params[:id] ]
    image = params[:image].read
    # puts image
    puts "DID IT REACH HERE?"
    obj.write(image)
    puts "If it reached here then obj.write worked?"

    render json: {"endpoint" => "reached"}
  end
end
