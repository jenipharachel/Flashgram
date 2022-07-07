# frozen_string_literal: true

class PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :load_post!, only: %i[show update destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    render status: :ok, json: { notice: "Post was successfully created" }
  end

  def show
    respond_with_json({ post: @post })
  end

  def update
    @post.update!(post_params)
    respond_with_json({ post: @post })
  end

  def destroy
    @post.destroy!
    respond_with_json
  end

  private

    def load_post!
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:caption, :main_image)
    end
end
