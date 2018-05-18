class DowngradeController < ApplicationController

  def create
    @user = current_user
    @wikis = policy_scope(Wiki)

    current_user.free!

    @wikis.update_all(:private => false)

    if @user.save
      flash[:notice] = "Your account has been downgraded to a free account."
      redirect_to home_show_path
    else
      flash.now[:alert] = "There was an error updating your account information. Please try again."
      render :edit
    end
  end
end
