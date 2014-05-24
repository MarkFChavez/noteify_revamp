require "spec_helper"

feature "Creating a note" do
  let!(:user) { create(:user) }

  context "as a signed in user" do
    background do
      sign_in_as user
    end

    it "shows it on the dashboard page" do
      click_on "New note"

      fill_in "Title", with: "Awesome work"
      fill_in "Content", with: "this is the content"
      click_on "Create"

      within "#notes" do
        expect(page).to have_css ".note-title", text: "Awesome work"
        expect(page).to have_css ".note-content", text: "this is the content"
      end
    end
  end
end
