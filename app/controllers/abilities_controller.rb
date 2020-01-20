class AbilitiesController < ApplicationController
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
    @ability = Ability.new(ability_params)
    @ability.character =  Character.find(params[:id])

    respond_to do |format|
      if @ability.save
        format.html { redirect_to @ability, notice: 'Ability was successfully created.' }
        format.json { render :show, status: :created, location: @ability }
      else
        format.html { render :new }
        format.json { render json: @ability.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ability.update(ability_params)
        format.html { redirect_to @ability, notice: 'Ability was successfully updated.' }
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
      format.html { redirect_to abilities_url, notice: 'Ability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private

  private
  def ability_params
    params.require(:ability).permit(:name, :value, :picture)
  end

  def set_recipe
    @ability = Ability.find(params[:id])
  end

end
