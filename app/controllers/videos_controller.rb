class VideosController < ApplicationController

	def index
		@videos = Video.order('created_at Desc')
	end

	def new 
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		
	end


end
