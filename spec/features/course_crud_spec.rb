require "rails_helper"
require "pry"

describe "user adds course" do
  let(:course) { build(:course) }
  before(:example) { visit new_course_path }

  context "with valid attributes" do
    it "adds course successfully" do
      fill_in "course_ar_title"     , with: course.ar_title
      fill_in "course_en_title"     , with: course.en_title
      fill_in "course_description"  , with: course.description
      select course.video_host.to_s , from: "course_video_host"
      fill_in "course_video_id"     , with: course.video_id
      check "course_premium"
      check "course_active"
      click_on "Create Course"
      expect(page).to have_text(course.en_title)
    end
  end

  context "with invalid attributes" do
    it "fails and renders new template" do
      fill_in "course_ar_title"     , with: nil
      fill_in "course_en_title"     , with: nil
      fill_in "course_description"  , with: nil
      select course.video_host.to_s , from: "course_video_host"
      fill_in "course_video_id"     , with: nil
      click_on "Create Course"
      expect(page).to have_text("can't be blank")
    end
  end
end
