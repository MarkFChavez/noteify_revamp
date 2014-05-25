require "spec_helper"

feature "Deleting a note" do
  let!(:user) { create(:user) }
  let!(:note) { create(:note, user: user) }

  context "as a signed in user" do
    background do
      sign_in_as user
    end

    describe "when I delete a note" do
      background do
        within "#note_#{note.id}" do
          click_on "Delete"
        end
      end

      it "does not show on the dashboard page" do
        expect(page).to_not have_content note.title
        expect(page).to_not have_content note.content
      end

      it "shows on the archive page" do
        click_on "Archives"

        expect(page).to have_content note.title
        expect(page).to have_content note.content
      end
    end
  end
end
