class HomeController < ApplicationController
  skip_before_action :ensure_user_login

  def index
    if current_user
      redirect_to todos_path
    else
      render "index"
    end
  end
end
