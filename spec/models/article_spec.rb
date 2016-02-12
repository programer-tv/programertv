require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    it { should validate_presence_of(:ar_title) }
    it { should validate_uniqueness_of(:ar_title) }
    it { should validate_presence_of(:en_title) }
    it { should validate_uniqueness_of(:en_title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_size(:image).in(0..2.megabytes) }
    it { should validate_attachment_content_type(:image).allowing("image/jpeg",
                                                                  "image/png") }
  end

  it "gets all active/inactive articles if user is admin" do
    admin_user = create(:admin)
    create(:article, active: false)
    create(:article, active: true)
    create(:article, active: false)
    expect(Article.get_articles(admin_user).map(&:active)). to \
      match([false, true, false])
  end

  it " gets only active articles if regular user" do
    regular_user = create(:user)
    create(:article, active: false)
    create(:article, active: true)
    create(:article, active: false)
    expect(Article.get_articles(regular_user).map(&:active)). to match([true])
  end
end
