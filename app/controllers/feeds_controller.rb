class FeedsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @feeds = current_user.feeds
  end

end
