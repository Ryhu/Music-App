class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user.nil?
      render :new
    elsif @user.activated?
      log_in!
      redirect_to bands_url
    else
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    log_out!
    redirect_to new_user_url
  end
end
