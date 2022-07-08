# frozen_string_literal: true

class UsersController < ApplicationController
  protect_from_forgery with: :null_session
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
