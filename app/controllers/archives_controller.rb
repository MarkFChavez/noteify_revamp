class ArchivesController < ApplicationController
  def index
    @notes = current_user.notes.only_deleted
  end
end
