class CommentsController < ApplicationController

  # GET /comments/new
  def new
    @comment = Deploy.find(deploy_param).comments.new()
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to :root, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:deploy_id, :comment, :user_id)
    end
    
    def deploy_param
      params.require(:deploy_id)
    end

end
