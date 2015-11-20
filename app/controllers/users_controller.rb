class UsersController < ApplicationController
  def home
    # render(:text => params)
  end

  def sign_up
    # render(:text => params)
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to profile_path(user.name)
    end
  end

  def sign_in
    # render(:text => params)
    user = User.find_by_email(params[:sesion][:email])
    if user && user.authenticate(params[:sesion][:password])
      login(user)
      redirect_to profile_path(user.name)
    else
      render :home
    end
  end

  def sign_out
    logout
    redirect_to home_path

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
