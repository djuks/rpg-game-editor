class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character, only: [:show, :edit, :update, :destroy, :vote]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  respond_to :js, :json, :html

  def index
    @characters = Character.order(:name).page(params[:page]).per(3)
  end

  def show

  end

  def new
    @character = Character.new
  end

  def edit

  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user

    if @character.save
      flash[:success] = "Character was created successfully!"
      redirect_to character_path(@character)
    else
      render 'new'
    end
  end

  def update
    if @character.update(character_params)
      flash[:success] = "Character was updated successfully!"
      redirect_to character_path(@character)
    else
      render 'edit'
    end
  end

  def destroy
    @character.destroy
    flash[:danger] = "Character was deleted successfully"
    redirect_to characters_path
  end

  def vote
    if !current_user.liked? @character
      @character.liked_by current_user
    elsif current_user.liked? @character
      @character.unliked_by current_user
    end
  end

  private

    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :image, :description)
    end

    def require_same_user
      if current_user != @character.user
        redirect_to characters_path
      end
    end
end
