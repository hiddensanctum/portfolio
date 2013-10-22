class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'comment waiting for moderation.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
end
