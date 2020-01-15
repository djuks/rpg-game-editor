class UsersController < ApplicationController



  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)

  end
end
