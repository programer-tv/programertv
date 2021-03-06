require 'rails_helper'

describe Course, type: :model do
  describe "validations" do
    it { should have_many(:episodes) }
    it { should validate_presence_of(:ar_title) }
    it { should validate_uniqueness_of(:ar_title) }
    it { should validate_presence_of(:en_title) }
    it { should validate_uniqueness_of(:en_title) }
    it { should validate_presence_of(:instructor) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:video_host) }
    it { should validate_presence_of(:video_id) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_size(:image).in(0..2.megabytes) }
    it { should validate_attachment_content_type(:image).allowing("image/jpeg",
                                                                  "image/png") }
  end

  context "episode order" do
    it "retrieves episodes sequentially in ascending order" do
      course = create(:course)
      create(:episode, course: course, sequence: 2)
      create(:episode, course: course, sequence: 3)
      create(:episode, course: course, sequence: 1)
      expect(course.get_sequential_episodes.map(&:sequence)).to match([1, 2, 3])
    end
  end

  it "gets all active/inactive courses if user is admin" do
    admin_user = create(:admin)
    create(:course, active: false)
    create(:course, active: true)
    create(:course, active: false)
    expect(Course.get_courses(admin_user).map(&:active)). to \
      match([false, true, false])
  end

  it " gets only active courses if regular user" do
    regular_user = create(:user)
    create(:course, active: false)
    create(:course, active: true)
    create(:course, active: false)
    expect(Course.get_courses(regular_user).map(&:active)). to match([true])
  end
end
