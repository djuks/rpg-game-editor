class PagesController < ApplicationController
  def home
    @characters = Character.order("created_at desc").limit(3)
  end
end
