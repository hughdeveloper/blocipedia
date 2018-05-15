class DowngradeController < ApplicationController

  def create
    @user = current_user

     current_user.free!

    if @user.save
      flash[:notice] = "Your account has been downgraded to a free account."
      redirect_to home_show_path
    else
      flash.now[:alert] = "There was an error updating your account information. Please try again."
      render :edit
    end
  end
end
