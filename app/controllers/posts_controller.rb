class PostsController < ApplicationController
  def create
    # render(:text => params)
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to profile_path(current_user.name)
    end

  end
  private
  def post_params
    params.require(:post).permit(:body)
  end
end
