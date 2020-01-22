class HomeController < ApplicationController
  def index
    @characters = Character.order("created_at desc").limit(3)
  end
end
