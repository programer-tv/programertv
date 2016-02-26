require "rails_helper"

RSpec.describe VideoPolicy do
  subject { described_class }

  permissions :index?, :show? do
    it "grants access to regular user" do
      expect(subject).to permit(create(:user), create(:video))
    end

    it "grants access to admin user" do
      expect(subject).to permit(create(:admin))
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it "denies access to regular user" do
      expect(subject).not_to permit(create(:user))
    end

    it "grants access to admin user" do
      expect(subject).to permit(create(:admin))
    end
  end
end
