class TweetsController < ApplicationController

  def new
  end

  def create
    @tweet_message = api_data(current_user).client.update(params[:tweet][:message])
    redirect_to root_path
  end

  def update
    twitter_data = api_data(current_user)
    twitter_data.client.favorite(params[:id].to_i)
    redirect_to root_path
  end

end
