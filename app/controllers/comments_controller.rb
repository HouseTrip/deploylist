class CommentsController < ApplicationController
  def index
    @deploy = Deploy.find_by(sha: params[:deploy_sha])
    @comments = @deploy.comments.by_most_recent
  end

  def new
    deploy = Deploy.find_by(sha: params[:deploy_sha])
    @comment = Comment.new(deploy: deploy)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to deploy_comments_path(deploy_sha: @comment.deploy.sha)
    else
      # set error message
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :deploy_id,
      :text
    ).merge(user: current_user)
  end
end

