class NotesController < ApplicationController
  def new
    @note = new_note
  end

  def create
    @note = current_user.notes.build note_params

    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def new_note
    Note.new
  end

  def note_params
    params.require(:note).
      permit(:title, :content)
  end
end
