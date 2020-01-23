class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @character = Character.find(params[:character_id])
    @comment = @character.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment was created successfully"
      redirect_to character_path(@character)
    else
      flash[:danger] = "Comment was not created"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end

end
