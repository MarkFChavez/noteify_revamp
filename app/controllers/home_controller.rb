class HomeController < ApplicationController
  def index
    @notes = notes
  end

  private

  def notes
    current_user.notes
  end
end
