class RelationshipsController < ApplicationController
  def create
     # render(:text => params[:idol_id])
     user = User.find(params[:idol_id])
     current_user.follow(user)
    redirect_to profile_path(user.name)
  end

  def destroy
    # render(:text => params[:idol_id])
    user = User.find(params[:idol_id])
    current_user.unfollow(user)
    redirect_to profile_path(user.name)
  end
end
