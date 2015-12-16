class Tweet

  def self.service
    TweetService.new
  end

  def self.all
    service.tweets.map { |tweet| build_object(tweet) }
  end

  def self.find(id)
    build_object(service.tweet(id))
  end

  def self.create(params)
    build_object(service.create_tweet(params))
  end

  def self.update(id, params)
    build_object(service.update_tweet(id, params))
  end

  def self.destroy
    build_object(service.delete_tweet(id))
  end

  def self.complete_info(id)
    build_object(service.complete_info(id))
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end

end
