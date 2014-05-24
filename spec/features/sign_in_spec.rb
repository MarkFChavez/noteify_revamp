require "spec_helper"

feature "Signing in" do
  context "valid user" do
    let!(:valid_user) { create(:user) }

    background do
      visit new_user_session_path

      fill_in "Email", with: valid_user.email
      fill_in "Password", with: valid_user.password
      click_on "Sign in"
    end

    it "shows me the dashboard page" do
      expect(page).to have_css ".header", text: "Dashboard"
    end

    it "displays the user email" do
      expect(page).to have_css ".whoami", text: valid_user.email
    end
  end

  context "invalid user" do
    let!(:invalid_user) { build(:user) }

    it "displays an error message" do
      visit new_user_session_path

      fill_in "Email", with: invalid_user.email
      fill_in "Password", with: invalid_user.password
      click_on "Sign in"     

      expect(page).to have_css ".alert", text: "Invalid email or password"
    end
  end
end
