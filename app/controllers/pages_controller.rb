class PagesController < ApplicationController
  before_action :load_characters, only: :home
  def home

  end

  private

  def load_characters
    @characters = Character.order("created_at desc").limit(3)
  end
end
