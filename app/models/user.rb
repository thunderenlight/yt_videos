class User < ApplicationRecord

	class << self
		def from_omniauth(auth)
			user = User.find_or_initialize_by(uid: auth['uid'])
			user.name = auth['info']['name']
			user.token = auth['credentials']['token']
			user.save!
			user
		end
	end
end
# http://127.0.0.1:3000/auth/google_oauth2/callback