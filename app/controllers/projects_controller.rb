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
        format.html { render :new }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated' }
        format.js
      else
        format.html { render :edit }
      end
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
