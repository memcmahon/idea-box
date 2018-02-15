class UsersController < ApplicationController
  layout "welcome_layout", only:[:new]
  layout "logout_layout", only:[:show]

  def show
    @user = current_user
    if current_admin?
      render :admin_show
    else
      render :show
    end
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
