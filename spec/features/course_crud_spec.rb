require "rails_helper"

describe "adding course" do
  let(:course) { build(:course) }
  before(:example) { visit new_course_path }

  context "with valid attributes" do
    it "succeeds" do
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
    it "fails" do
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

describe "editing course" do
  let(:course) { build(:course) }
  before(:example) { visit edit_course_path(create(:course)) }

  context "with valid attributes" do
    it "succeeds" do
      fill_in "course_ar_title"     , with: course.ar_title
      fill_in "course_en_title"     , with: course.en_title
      fill_in "course_description"  , with: course.description
      select course.video_host.to_s , from: "course_video_host"
      fill_in "course_video_id"     , with: course.video_id
      check "course_premium"
      check "course_active"
      click_on "Update Course"
    end
  end

  context "with invalid attributes" do
    it "fails" do
      fill_in "course_ar_title"     , with: nil
      fill_in "course_en_title"     , with: nil
      fill_in "course_description"  , with: nil
      select course.video_host.to_s , from: "course_video_host"
      fill_in "course_video_id"     , with: nil
      click_on "Update Course"
      expect(page).to have_text("can't be blank")
    end
  end
end

describe "deleting course" do
  it "succeeds" do
    course = create(:course)
    visit course_path(course)
    page.driver.submit :delete, "/courses/#{course.id}", {}
    expect(page).not_to have_text(course.en_title)
  end
end
