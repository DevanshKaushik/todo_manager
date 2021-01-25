class UsersController < ApplicationController
  skip_before_action :ensure_user_login

  def new
    render "users/new"
  end

  def create
    new_user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    redirect_to "/"
  end
end
