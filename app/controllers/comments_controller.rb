class CommentsController < ApplicationController
before_filter :load_auction

  def index
    @comments = @post.comments.all
  end

  def new
    @comments = @post.comments.new
  end

  def create
    @comments = @post.comments.create(comment_params)
    if @comments.save
      @comments.user_id = current_user.id
      redirect_to post_comments_path(@post.id)
    else
      render 'new'
    end
  end

  def show
    @comments = @post.comments.find(params[:id])
  end

 private
  def comment_params
    params.require(:comment).permit(:description)
  end

  def load_auction
    @post = Post.find(params[:post_id])
  end

end

