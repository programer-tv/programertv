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

    it "grants access to regular user to view his own profile" do
      user = create(:user)
      expect(subject).to permit(user, User.find(user.id))
    end

    it "denies access to regular user to view other user profile" do
      user_1 = create(:user)
      user_2 = create(:user)
      expect(subject).not_to permit(user_1, User.find(user_2.id))
    end
  end
end
