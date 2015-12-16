class TwitterService
  attr_reader :client

  def initialize(current_user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['api_key']
      config.consumer_secret     = ENV['api_secret']
      config.access_token        = current_user[:oauth_token]
      config.access_token_secret = current_user[:oauth_token_secret]
    end
  end

  def complete_info(id)
    @tweet_info = parse(client.get("complete_info/#{id}"))
  end

  def tweets
    parse(client.get('tweets'))
  end

  def tweet(id)
    parse(client.get("tweets/#{id}"))
  end

  def create_tweet
    parse(client.update('tweets', params))
  end

  def update_tweet(id, params)
    parse(client.patch("tweets/#{id}", params))
  end

  def delete_tweet(id)
    parse(client.delete("tweets/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
