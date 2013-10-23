class CommentsController < ApplicationController

  before_filter :load_post_comment


  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'comment waiting for moderation.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        @comments = @post.comments
        format.html { render template: "posts/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    authorize @comment
    @comment = Comment.find(params[:id])
    @post = @comment.post

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @post, notice: 'comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    authorize @post
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @post, notice: 'comment was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def load_post_comment

  end

end
