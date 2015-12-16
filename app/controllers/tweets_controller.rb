class TweetsController < ApplicationController

  def new
  end

  def create
    @tweet_message = api_data(current_user).client.update(params[:tweet][:message])
    redirect_to root_path
  end

end
