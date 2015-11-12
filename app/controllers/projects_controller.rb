class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy, :edit, :update]

  def index
    @projects = Project.all
  end

  def new 
    @project = Project.new
  end

  def create
	@project = Project.new(project_params)
	
	if @project.save
		flash[:notice] = "Se guardo la raja el proyecto"
		redirect_to @project
	else
		render 'new'
	end
  end

  def show
  end

  def destroy
    @project.destroy
    flash[:notice] = "El proyecto a sido borrado"
    redirect_to @project
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to @project
  end

  private

  def project_params
  	params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
