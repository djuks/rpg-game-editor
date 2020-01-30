class AbilitiesController < ApplicationController
  before_action :get_character
  before_action :set_ability, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @ability = Ability.new
  end

  def edit
  end

  def create
    @ability = @character.abilities.build(ability_params)
    respond_to do |format|
      if @ability.save
        format.js { flash.now[:notice] = "Ability was successfully created" }
        format.html { redirect_to @character, notice: 'Ability was successfully created.' }
      else
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ability.update(ability_params)
        format.js { flash.now[:notice] = "Ability was updated successfully" }
        format.html { redirect_to @character, notice: 'Ability was successfully updated.' }
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @ability.destroy
    respond_to do |format|
      format.js { flash.now[:notice] = "Ability was deleted successfully" }
      format.html { redirect_to @character, notice: 'Ability was successfully destroyed.' }
    end
  end

  private

  def set_ability
    @ability = Ability.find(params[:id])
  end

  def ability_params
    params.require(:ability).permit(:name, :value, :picture, :character_id)
  end

  def get_character
    @character = Character.find(params[:character_id])
  end

  def require_same_user
    if current_user != @character.user
      redirect_to characters_path
    end
  end
end
