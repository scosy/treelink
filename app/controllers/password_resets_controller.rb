class PasswordResetsController < ApplicationController
  before_action :load_user_with_token, only: [:edit, :update]

  def new
  end

  def create
    if (user = User.find_by(email: params[:email]))
      token = user.generate_token_for(:password_reset)
      PasswordMailer.with(
        user:,
        token:
      ).password_reset.deliver_later
    end
    redirect_to root_path, notice: 'Un mail de récupération de mot de passe a été envoyé.'
  end

  def edit
  end

  def update
    if @user.update(password_params)
      redirect_to new_session_path, notice: 'Votre mot de passe a été modifié avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def load_user_with_token
    @user = User.find_by_token_for(:password_reset, params[:token])
    redirect_to new_password_reset_path, alert: 'Le jeton de récupération est invalide, veuillez réessayer' unless @user.present?
  end

  def password_params
    params.require(:user).permit(%w[password password_confirmation])
  end
end
