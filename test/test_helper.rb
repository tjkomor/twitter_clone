SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
require 'webmock'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include Capybara::DSL
  def setup
    Capybara.app = Tweet4trump::Application
    stub_omniauth
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      {"provider"=>"twitter",
         "uid"=>"4586543058",
         "info"=>
        {"nickname"=>"testtylertweet",
         "name"=>"Tyler Testing",
         "email"=>nil,
         "location"=>"",
         "image"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png",
         "description"=>"",
         "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/testtylertweet"}},
       "credentials"=>{"token"=>"4586543058-7I99doFE7OO0OzwEmSvzFy6S4NpqltmmraDGHlQ", "secret"=>"lxM2sMv0UNU5wySSszp2oOJw2jyGGwdM4O425dVfH92y8"},
       "extra"=> {

         "raw_info"=>
          {"id"=>4586543058,
           "id_str"=>"4586543058",
           "name"=>"Tyler Testing",
           "screen_name"=>"testtylertweet",
           "location"=>"",
           "description"=>"",
           "url"=>nil,
           "entities"=>{"description"=>{"urls"=>[]}},
           "protected"=>false,
           "followers_count"=>1,
           "friends_count"=>40,
           "listed_count"=>0,
           "created_at"=>"Thu Dec 17 18:16:47 +0000 2015",
           "favourites_count"=>1,
           "utc_offset"=>nil,
           "time_zone"=>nil,
           "geo_enabled"=>false,
           "verified"=>false,
           "statuses_count"=>1,
           "lang"=>"en",
           "contributors_enabled"=>false,
           "is_translator"=>false,
           "is_translation_enabled"=>false,
           "profile_background_color"=>"F5F8FA",
           "profile_background_image_url"=>nil,
           "profile_background_image_url_https"=>nil,
           "profile_background_tile"=>false,
           "profile_image_url"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png",
           "profile_image_url_https"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png",
           "profile_link_color"=>"2B7BB9",
           "profile_sidebar_border_color"=>"C0DEED",
           "profile_sidebar_fill_color"=>"DDEEF6",
           "profile_text_color"=>"333333",
           "profile_use_background_image"=>true,
           "has_extended_profile"=>false,
           "default_profile"=>true,
           "default_profile_image"=>true,
           "following"=>false,
           "follow_request_sent"=>false,
           "notifications"=>false
    }}}
    )
  end

  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end

  # Add more helper methods to be used by all tests here...
end
