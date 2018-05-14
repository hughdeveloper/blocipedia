class HomeController < ApplicationController

  def index
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update!(user_downgrade)

    if @user.save
      flash[:notice] = "Your account has been downgraded to a free account."
      redirect_to home_show_path
    else
      flash.now[:alert] = "There was an error updating your account information. Please try again."
      render :edit
    end
  end



  private

  def user_downgrade
    @user.role = 0
    params.permit(:role)
  end
end
