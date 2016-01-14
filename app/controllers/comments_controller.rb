class CommentsController < ApplicationController
  before_filter :load_deploy

  def index
  	@comments = Comment.where(deploy_id: params[:deploy_id])
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new comment_params
  	@comment.deploy = @deploy
  	@comment.user = current_user
  	if @comment.save
  	  redirect_to deploy_comments_path(@deploy)
  	else
  	  render :new
  	end
  end

  private

  def load_deploy
  	@deploy = Deploy.includes(comments: :user).find params[:deploy_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end