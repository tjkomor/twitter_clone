module Client
  def twitter_client(user)
    @twitter_client ||= TweetService.new(user).client
  end
end
