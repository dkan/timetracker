class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to root_path
    else
      flash[:error] = @project.errors.full_messages
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :rate)
  end
end
