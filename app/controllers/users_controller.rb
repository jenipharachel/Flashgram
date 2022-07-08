# frozen_string_literal: true

class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user_using_x_auth_token, only: :create

  def create
    @user = User.create!(user_params)
    @user.save!
    respond_with_success("User is successfully created!")
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
