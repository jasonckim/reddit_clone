class PostsController < ApplicationController

  def index 
    @posts = Post.all
    @user = current_user
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.create(posts_params)
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

private
  def posts_params
    params.require(:post).permit(:title, :body, :comments_attributes => [:description])
  end

end
