class UsersController < ApplicationController
  def home
    # render(:text => params)
  end

  def sign_up
    # render(:text => params)
    user = User.new(user_params)
    if user.save
      redirect_to profile_path(user.name)
    end
  end

  def profile
    # render(:text => params)
    @user = User.find_by_name(params[:name])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
