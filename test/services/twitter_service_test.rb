require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  def create_tyler
  user = User.create(name: "Tyler Komoroske",
                     screen_name: 'tjkomor',
                     uid: ENV['tyler_uid'],
                     oauth_token: ENV['tyler_access_token'],
                     oauth_token_secret: ENV['tyler_access_token_secret']
                      )
  end

  test "VCR correctly setup" do
    VCR.use_cassette('twitter_service#home_feed') do
      user = create_tyler
      service = TwitterService.new(user)

      assert_equal "@patwey testing 1-2-3", service.client.user_timeline.first.text
    end
  end

  test "user access token key is correct" do
    VCR.use_cassette('twitter_service#home_feed') do
      user = create_tyler
      service = TwitterService.new(user)

      assert_equal ENV['tyler_access_token'], service.client.access_token
    end
  end

  test "user secret access token key is correct" do
    VCR.use_cassette('twitter_service#user_access') do
      user = create_tyler
      service = TwitterService.new(user)

      assert_equal ENV['tyler_access_token_secret'], service.client.access_token_secret
    end
  end

  test "user screen name is correct" do
    VCR.use_cassette('twitter_service#secret_access') do
      user = create_tyler
      service = TwitterService.new(user)

      assert_equal 'tyler_komoroske', service.client.user.screen_name
    end
  end
end
