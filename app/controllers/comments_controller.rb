class CommentsController < ApplicationController

before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'comment waiting for moderation.' }
        format.json { render json: @commentable, status: :created, location: @commentable }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @commentable, notice: 'comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable, notice: 'comment was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

end
