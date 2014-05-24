module NoteHelpers
  def create_a_note title, content
    click_on "New note"

    fill_in "Title", with: title
    fill_in "Content", with: content

    click_on "Create"
  end
end

RSpec.configure do |config|
  config.include NoteHelpers
end
