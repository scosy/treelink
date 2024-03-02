class PasswordsController < ApplicationController
  before_action :authenticate_user!
  def edit
  end

  def update
    if current_user.update(password_params)
      redirect_to edit_password_path, notice: "Mot de passe modifié avec succès !"
    else
      flash[:alert] = current_user.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def password_params
    params.require(:user).permit(
      %w[password password_confirmation password_challenge]
    ).with_defaults(password_challenge: "")
  end
end
