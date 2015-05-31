Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], 
  provider :facebook, 843452602406706, f4a6b5a09ba04ff4a7dfd718a3e1756d, 
  	{:scope => 'email,user_friends,read_insights,user_location,user_hometown,user_groups,user_education_history,user_about_me,user_likes,user_actions.books'}
end