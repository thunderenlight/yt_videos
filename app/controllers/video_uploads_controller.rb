class VideoUploadsController < ApplicationController
  def new
  	p "******$hi there new"
    @video_upload = VideoUpload.new
  end

  def create
  	p "******$hi there create"
  	p "#{current_user.token == true }"
    @video_upload = VideoUpload.new(title: params[:video_upload][:title],
                                    description: params[:video_upload][:description],
                                    file: params[:video_upload][:file].try(:tempfile).try(:to_path))
    if @video_upload.save
      uploaded_video = @video_upload.upload!(current_user)

      if uploaded_video.failed?
        flash[:error] = 'There was an error while uploading your video...'
      else
        Video.create({link: "https://www.youtube.com/watch?v=#{uploaded_video.id}"})
        flash[:success] = 'Your video has been uploaded!'
      end
      redirect_to root_url
    else
      render :new
    end
  end

  private


end