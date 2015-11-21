class PublicationsController < ApplicationController
  def index
    # render(:text => params)
    @posts = current_user.feed
  end
end
