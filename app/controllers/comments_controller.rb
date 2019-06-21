class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, except: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    redirect_back(fallback_location: root_path) if @comment.save
  end

  def destroy
    redirect_back(fallback_location: root_path) if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :product_id, :text)
  end

  def find_comment
    @comment = Comment.find(params[:id])
end
end
