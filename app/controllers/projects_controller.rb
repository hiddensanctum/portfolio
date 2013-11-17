class ProjectsController < ApplicationController
  def index
    @projects = Project.all

  end

  def new
    @project = Project.new

  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully added.' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was successfully updated'
      respond_to do |format|
        format.html { redirect_to @project }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @project = Project.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Project was successfully deleted' }
      format.js
    end
  end
end
