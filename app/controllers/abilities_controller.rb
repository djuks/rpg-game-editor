class AbilitiesController < ApplicationController
  before_action :get_character
  before_action :set_ability, only: [:show, :edit, :update, :destroy]


  def index
    @abilities = Ability.all
  end

  def show
  end

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
        format.html { render :new }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ability.update(ability_params)
        format.js { flash.now[:notice] = "Ability was updated successfully" }
        format.html { redirect_to @character, notice: 'Ability was successfully updated.' }
        format.json { render :show, status: :ok, location: @ability }
      else
        format.html { render :edit }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ability.destroy
    respond_to do |format|
      format.html { redirect_to @character, notice: 'Ability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

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
end
