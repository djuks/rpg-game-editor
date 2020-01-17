class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.order(:name).page(params[:page]).per(3)
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
    @character.abilities.build
  end

  # GET /characters/1/edit
  def edit
    @character.abilities.build
  end

  # POST /characters
  # POST /characters.json
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


  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @character.update(character_params)
      flash[:success] = "Character was updated successfully!"
      redirect_to character_path(@character)
    else
      render 'edit'
    end
  end


  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    flash[:danger] = "Character was deleted successfully"
    redirect_to characters_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :image, :description, abilities_attributes: [:id, :_destroy, :character_id, :name, :value, :picture])
    end

    def require_same_user
      if current_user != @character.user
        redirect_to characters_path
      end
    end
end
