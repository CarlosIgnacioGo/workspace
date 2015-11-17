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
  		flash[:notice] = "El projecto se guardo correctamente"
  		redirect_to @project
  	else
      flash[:alert] = "El projecto no se guardo correctamente"
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
    if @project.update(project_params)
      flash[:notice] = "Projecto editado correctamente"
      redirect_to @project
    else
      flash[:alert] = "El projecto no se pudo editar"
      render 'edit'
    end   
  end

  private

  def project_params
  	params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
