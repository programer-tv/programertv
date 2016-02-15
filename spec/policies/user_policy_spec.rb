require "rails_helper"

RSpec.describe UserPolicy do
  subject { described_class }

  permissions :index? do
    it "grants access to admin user" do
      expect(subject).to permit(create(:admin))
    end

    it "denies access to regular user" do
      expect(subject).not_to permit(create(:user))
    end
  end

  permissions :show? do
    it "grants access to admin user" do
      expect(subject).to permit(create(:admin))
    end
  end
end
