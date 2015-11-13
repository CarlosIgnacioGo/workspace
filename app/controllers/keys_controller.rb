class KeysController < ApplicationController
	before_action :set_project
	before_action :set_key, only: [:show, :edit, :update, :destroy]

	def new
	  @key = @project.keys.build
	end

	def create
	  @key = @project.keys.build(key_params)
	  @key.save
	  redirect_to @project
	end

	def show
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
