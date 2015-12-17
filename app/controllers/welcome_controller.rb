class WelcomeController < ApplicationController
  def index
    if current_user
      @twitter_data = api_data(current_user)
      @user = current_user
    end
  end
end
