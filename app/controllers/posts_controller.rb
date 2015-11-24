class PostsController < ApplicationController
  def create
    # render(:text => params)
    post = current_user.posts.create(post_params)
    picture = post.pictures.create(picture_params)
    redirect_to profile_path(current_user.name)
  end
  private
  def post_params
    params.require(:post).permit(:body)
  end

  def picture_params
    params.require(:post).permit(:image)
  end
end
