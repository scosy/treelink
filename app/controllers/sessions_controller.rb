class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))
      login user
      redirect_to root_path, notice: "Connecté."
    else
      flash[:alert] = "Email ou mot de passe incorrect."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Déconnecté."
  end
end
