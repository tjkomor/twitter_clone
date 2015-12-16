class WelcomeController < ApplicationController

  def index
    @service = TweetService.new(current_user)
  end
end
