class SearchesController < ApplicationController
  def search
    # render(:text => params)
    if params[:query].present?
      users = User.search(params[:query])
      user = users.first
      redirect_to profile_path(user.name)
    else
      @users = []
      redirect_to :back
    end
  end

  def autocomplete
    render json: User.search(params[:query], autocomplete: true, limit: 10).map do |user|
                  {name: user.name, value: user.id}
                end
  end
end
