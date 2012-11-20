class FeedsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @feeds = current_user.feeds
  end

  def new
    @feed = current_user.feeds.build
  end

  def create
    @feed = current_user.feeds.build(params[:feed])
    if @feed.save
      flash[:notice] = "Your feed was saved."
      redirect_to feeds_path
    else
      render 'new'
    end
  end

end
