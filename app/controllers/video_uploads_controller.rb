class VideoUploadsController < ApplicationController
  def new
  	@video_upload = VideoUploads.new(title: params[:video_upload][:title],
  									description: params[:video_upload][:description],
  									file: params[:video_upload][:file].try(:tempfile).try(:to_path))

  	if @video_upload.save
  		upload_video = @video_upload.upload!(current_user)
  		#check if video was uploaded
  		if @video_upload.failed?
  			flash[:error] = 'There was an error while uploading your file...'
  		else
  			Video.create({link: 'https://www.youtube.com/watch?v=#{upload_video.id}'})
  			flash[:success] = 'Your file has been uploaded!'
  		end
  		redirect_to root_url
  	else
  		render :new 
  	end
  end

  def create
  end
end
