class CommentsController < ApplicationController
  before_action :get_character
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @character.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.js { flash.now[:notice] = "comment was successfully created" }
        format.html { redirect_to @character, notice: 'comment was successfully created.' }
      else
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { flash.now[:notice] = "Comment was updated successfully" }
        format.html { redirect_to @comment, notice: 'omment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js { flash.now[:notice] = "Comment was deleted successfully" }
      format.html { redirect_to @comment, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :character_id, :user_id)
  end

  def get_character
    @character = Character.find(params[:character_id])
  end

  def require_same_user
    if current_user != @character.user && current_user != @comment.user
      redirect_to characters_path
    end
  end
end
