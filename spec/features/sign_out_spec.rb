require "spec_helper"

feature "Signing out" do
  let!(:user) { create(:user) }

  background do
    sign_in_as user
  end

  describe "clicking the logout link" do
    it "signs out the user" do
      click_on "Sign out"

      expect(page).to have_content "Signed out successfully"
    end
  end
end
