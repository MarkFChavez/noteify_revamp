require "spec_helper"

feature "Signing in" do
  context "valid user" do
    let!(:valid_user) { create(:user) }

    background do
      sign_in_as valid_user
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
      sign_in_as invalid_user

      expect(page).to have_css ".alert", text: "Invalid email or password"
    end
  end
end
