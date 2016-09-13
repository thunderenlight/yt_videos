class VideosController < ApplicationController

	def index
		@videos = Video.order('created_at Desc')
	end

	def new 
		@video = Video.new
	end

	def create
		# p @video = YT::Video.new(url: 'https://www.youtube.com/watch?v=m_cZfV-IiAw')
		@video = Video.new(video_params)
		puts @video
		if @video.save
			flash[:success] = 'Video added!'
			redirect_to root_url
		else
			render :new
		end
	end
	private

	def video_params
		params.require(:video).permit(:link)
	end

end
