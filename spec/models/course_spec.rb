require 'rails_helper'

describe Course, type: :model do
  describe "validations" do
    it { should have_many(:episodes) }
    it { should validate_presence_of(:ar_title) }
    it { should validate_uniqueness_of(:ar_title) }
    it { should validate_presence_of(:en_title) }
    it { should validate_uniqueness_of(:en_title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:video_host) }
    it { should validate_presence_of(:video_id) }
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_size(:image).in(0..2.megabytes) }
    it { should validate_attachment_content_type(:image).allowing("image/jpeg",
                                                                  "image/png") }
  end
end
