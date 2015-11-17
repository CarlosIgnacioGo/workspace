class KeysController < ApplicationController
	before_action :set_project
	before_action :set_key, only: [:show, :edit, :update, :destroy]

	def new
	  @key = @project.keys.build
	end

	def create
	  @key = @project.keys.build(key_params)

	  if @key.save
	  	flash[:notice] = "La clave se guardo correctamente"
	  	redirect_to @project
	  else
	  	flash[:alert] = "La clave no se guardo correctamente"
	  	render 'new'
	  end 
	end

	def show
	end

	def edit
		
	end

	def update
	  if @key.update(key_params)
	  	flash[:notice] = "Clave editado correctamente"
	  	redirect_to [@project, @key]
	  else
	  	flash[:alert] = "Clave editado correctamente"
      	render 'edit'
	  end
	end

	def destroy
		@key.destroy
		flash[:notice] = "La clave a sido borrado"
		redirect_to @project
	end

	private
	def set_project
	  @project = Project.find(params[:project_id])
	end

	def set_key
      @key = @project.keys.find(params[:id])
    end

	def key_params
		params.require(:key).permit(:title, :link, :user, :password)
	end
end
