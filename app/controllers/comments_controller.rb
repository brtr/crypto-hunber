class CommentsController < ApplicationController
  def create
    project = RecommendProject.find_by id: comment_params[:recommend_project_id]

    if project
      comment = project.comments.new(comment_params)
      if comment.save
        flash[:notice] = t("views.notice.add_comment")
      else
        flash[:alert] = comment.errors.full_messages.join(', ')
      end
  
      redirect_to recommend_project_path(project)
    else
      flash[:alert] = t("views.error.no_project")
      redirect_to recommend_projects_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :recommend_project_id, :content)
  end
end
