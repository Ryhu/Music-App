class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      send_confirmation(@user)
      redirect_to new_session_url
    else
      render :new
    end
  end

  def activate
    user = User.find_by(activation_token: params[:activation_token])
    if !user.nil?
      user.toggle!(:activated)
      redirect_to new_session_url

    end
  end

  def send_confirmation(user)
    u = UserMailer.welcome_email(user)
    u.deliver
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
