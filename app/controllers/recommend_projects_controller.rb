class RecommendProjectsController < ApplicationController
  before_action :get_project, only: [:edit, :update, :destroy, :toggle_like]

  def index
    @page_index = 2
    @projects = RecommendProject.includes(:user_like_projects).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @project = RecommendProject.new
  end

  def create
    project = current_user.recommend_projects.new(project_params)
    if project.save
      flash[:notice] = "创建成功"
    else
      flash[:alert] = project.errors.full_messages.join(', ')
    end

    redirect_to recommend_projects_path
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "更新成功"
    else
      flash[:alert] = @project.errors.full_messages.join(', ')
    end

    redirect_to recommend_projects_path
  end

  def destroy
    if @project.destroy
      flash[:notice] = "删除成功"
    else
      flash[:alert] = @project.errors.full_messages.join(', ')
    end

    redirect_to recommend_projects_path
  end

  def toggle_like
    result = @project.user_like_projects.where(user_id: current_user.id).take

    if result
      result.delete
    else
      @project.user_like_projects.where(user_id: current_user.id).first_or_create
    end

    render json: {success: true}
  end

  private
  def get_project
    @project = RecommendProject.find params[:id]
  end

  def project_params
    params.require(:recommend_project).permit(:name, :website, :desc)
  end
end
