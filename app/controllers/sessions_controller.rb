class SessionsController < ApplicationController
  skip_before_action :ensure_user_login

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      render plain: "You have entered an incorrect password"
    end
  end
end
