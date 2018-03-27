class FoldersController < ApplicationController

  def new
  	@folder = Folder.new
  end

  def create
  	@folder = Folder.new(folder_params)
  	if @folder.save
  		flash[:success] = 'Folder created successfully.'
  		redirect_to root_path
  	else
  		flash[:warning] = 'Something went wrong.'
  		render 'new'
  	end
  end

  private
  def folder_params
    params.require(:folder).permit(:name)
  end
end
