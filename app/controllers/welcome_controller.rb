class WelcomeController < ApplicationController

  def index
    if current_user
      @tweets = current_user.tweets
    end
  end
end
