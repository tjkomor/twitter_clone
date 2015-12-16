class WelcomeController < ApplicationController

  def index
    if current_user
      @twitter_data = api_data(current_user)
    end
  end

  private

  def api_data(current_user)
    TwitterService.new(current_user)
  end
end
