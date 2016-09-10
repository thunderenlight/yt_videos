class VideoUpload < ActiveType::Object
	attribute :file, :string
	attribute :title, :string
	attribute :description, :text

	validates :file, presence :true
	validates :file, presence :true

	def upload!(user)
		account = Yt::Account.new access_token: user.token
		account.upload_video self.file, title: self.file, description: self.description
	end


	end
end