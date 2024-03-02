class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_registration_params)
    if @user.save
      login @user
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_registration_params
    params.require(:user).permit(%w[email password password_confirmation])
  end
end
