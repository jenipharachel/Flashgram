# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    render status: :ok, json: { notice: "Post was successfully created" }
  end

  private

    def post_params
      params.require(:post).permit(:caption, :main_image)
    end
end
