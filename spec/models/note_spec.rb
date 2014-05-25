require 'spec_helper'

describe Note do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_uniqueness_of(:title) }

  let!(:note) { create(:note) }

  describe "soft deletion" do
    it "updates the deleted_at timestamp" do
      note.destroy!

      expect(Note.only_deleted).to include note
    end
  end

  describe "default scope" do
    it "does not return soft deleted records" do
      note.destroy!

      expect(Note.all).to be_empty
    end
  end
end
