class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id
    if @comment.save
      flash[:notice] = 'Comment created!'
      redirect_to user_posts_path(current_user)
    else
      render :new, alert: 'Comment not created, please try again!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
