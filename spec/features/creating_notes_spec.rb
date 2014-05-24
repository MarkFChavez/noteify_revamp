require "spec_helper"

feature "Creating a note" do
  let!(:user) { create(:user) }

  context "as a signed in user" do
    background do
      sign_in_as user
    end

    describe "with valid note" do
      it "shows it on the dashboard page" do
        create_a_note "Awesome work", "this is the content"

        within "#notes" do
          expect(page).to have_css ".note-title", text: "Awesome work"
          expect(page).to have_css ".note-content", text: "this is the content"
        end

        expect(current_path).to eq root_path
      end
    end

    describe "invalid note" do
      it "shows an error page on the dashboard page" do
        create_a_note "", ""

        expect(page).to have_content "Title can't be blank"
        expect(page).to have_content "Content can't be blank"
      end
    end
  end
end
