require 'rails_helper'

describe Episode, type: :model do
  context "validations" do
    it { should belong_to(:course) }
    it { should validate_presence_of(:en_title) }
    it { should validate_uniqueness_of(:en_title).scoped_to(:course_id) }
    it { should validate_presence_of(:ar_title) }
    it { should validate_uniqueness_of(:ar_title).scoped_to(:course_id) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:sequence) }
    it { should validate_numericality_of(:sequence).is_greater_than(0) }
    it { should validate_uniqueness_of(:sequence).scoped_to(:course_id) }
    it { should validate_presence_of(:video_host) }
    it { should validate_presence_of(:video_id) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug).scoped_to(:course_id) }
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_size(:image).in(0..2.megabytes) }
    it { should validate_attachment_content_type(:image).allowing("image/jpeg",
                                                                  "image/png") }
  end
end
