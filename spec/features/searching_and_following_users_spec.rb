require "spec_helper"

feature "Searching and following users" do
  let!(:user1) { create(:user, email: "user1@noteify.com") }
  let!(:user2) { create(:user, email: "user2@noteify.com") }
  let!(:user3) { create(:user, email: "user3@noteify.com") }

  context "as a signed in user" do
    background do
      sign_in_as user1
    end

    describe "searching a user" do
      background do
        within "#search" do
          fill_in "user_name", with: "user2"
          click_on "Search"
        end
      end

      it "lists matching users" do
        within "#users" do
          expect(page).to have_content "user2@noteify.com"
        end
      end

      it "does not list non-matching users" do
        within "#users" do
          expect(page).to_not have_content "user1@noteify.com"
          expect(page).to_not have_content "user3@noteify.com"
        end
      end
    end

    describe "following a user" do
      background do
        visit users_path
      end

      it "follows a user" do
        within "#user_#{user2.id}" do
          click_on "Follow"
        end

        expect(page).to have_content "You are now following user2@noteify.com"

        within "#user_#{user2.id}" do
          expect(page).to have_content "Following"
        end
      end

      it "prohibits following of currently logged in user" do
        within "#user_#{user1.id}" do
          expect(page).to_not have_content "Follow"
          expect(page).to_not have_content "Following"
        end
      end
    end
  end
end
