class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
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

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def login
    user_email = params[:email]
    user_password = params[:password]

    user = User.find_by(email: user_email, password: user_password)
    if user.nil?
      render plain: false
    else
      render plain: true
    end
  end
end
