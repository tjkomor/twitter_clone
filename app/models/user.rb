class User < ActiveRecord::Base
  include Client
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def tweets
    twitter_client(self).user_timeline(screen_name)
  end

  def image
    twitter_client(self).current_user.profile_image_url
  end

  def followers_count
    twitter_client(self).current_user.followers_count
  end

  def friends_count
    twitter_client(self).current_user.friends_count
  end

  def statuses_count
    twitter_client(self).current_user.statuses_count
  end

  def description
    twitter_client(self).current_user.description
  end

end
