class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user_name = params[:name]
    user_email = params[:email]
    user_password = params[:password]

    new_user = User.create!(
      name: user_name,
      email: user_email,
      password: user_password,
    )

    response_text = "New user is created with the user_id: #{new_user.id}"
    render plain: response_text
  end
end
