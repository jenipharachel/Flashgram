class PostsController < ApplicationController  
  def index
    posts = Post.all
    render status: :ok, json: { posts: posts }
  end

  def create
    @post = Post.new(post_params)
    @post.save!
    # respond_with_success(t("successfully_created", entity: "Post"))
  end

  private
    def post_params
      params.require(:post).permit(:caption)
    end
end
