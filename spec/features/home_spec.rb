require "spec_helper"

feature "Home" do
  let!(:user) { create(:user) }

  context "as a signed in user" do
    background do
      sign_in_as user
    end

    describe "clicking the application name" do
      it "goes to homepage" do
        click_on "Noteify"

        expect(current_path).to eq root_path
      end
    end
  end
end
