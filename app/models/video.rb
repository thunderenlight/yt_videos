class Video < ApplicationRecord

	# attr_accessible :link

	YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

	validates :link, presence: true, format: YT_LINK_FORMAT


	def before_save(link) 
		begin
			video = Yt::Video.new url: link

			self.uid = video.id
			self.title = video.title
			self.likes = video.like_count
			self.dislikes = video.dislike_count
			self.comments = video.comment_count
			# self.duration = parse_duration(video.duration)
			self.published_at = video.published_at
		rescue Yt::Errors::NoItems
			self.title = ''
		end
			# uid = link.match(YT_LINK_FORMAT)
			# self.uid = uid[2] if uid && uid[2]

			# if self.uid.to_s.length !=11
			# 	self.errors.add(:link, 'is invalid.')
			# 	false
			
	end
end
