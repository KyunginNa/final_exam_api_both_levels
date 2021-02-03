class Api::CommentsController < ApplicationController
  def create
    comment = current_user.comments.create(comment_params)
    if comment.persisted?
      render json: { message: "Your comment was created successfully!" }, status: 201
    else
      status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
  
end
