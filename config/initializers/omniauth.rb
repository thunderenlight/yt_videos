Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :google_oauth2, ' 952285415540-pktt3bojdhui2sivt8mome1plfa9ok27.apps.googleusercontent.com ', ' TlX2YVWLxtVNpUF2xcUbQgUj ', scope: 'userinfo.profile,youtube'
end

