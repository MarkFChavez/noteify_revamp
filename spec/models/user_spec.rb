require 'spec_helper'

describe User do
  it { should have_many(:notes).dependent(:destroy) }

  context "associations" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }

    it "#followed_users" do
      user.follow! user2
      expect(user.followed_users).to include user2
    end

    it "#followers" do
      user.follow! user2
      expect(user2.followers).to include user
    end
  end

end
