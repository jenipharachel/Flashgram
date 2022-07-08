# frozen_string_literal: true

class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user_using_x_auth_token

  def create
    @user = User.find_by!(email: login_params[:email].downcase)
    unless @user.authenticate(login_params[:password])
      respond_with_error("Incorrect credentials, try again.", :unauthorized)
    end
  end

  def destroy
    @current_user = nil
    respond_with_success("User logged out!")
  end

  private

    def login_params
      params.require(:login).permit(:email, :password)
    end
end
