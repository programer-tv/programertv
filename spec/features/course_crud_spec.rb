require "rails_helper"

describe "create course", js: true do
  let(:course) { build(:course) }
  before(:example) { visit new_course_path }

  it "succeeds with valid attributes" do
    fill_in "course_ar_title"     , with: course.ar_title
    fill_in "course_en_title"     , with: course.en_title
    fill_in "course_description"  , with: course.description
    select course.video_host.to_s , from: "course_video_host"
    fill_in "course_video_id"     , with: course.video_id
    check "course_premium"
    check "course_active"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "Course created successfully!")
  end

  it "fails with invalid attributes" do
    fill_in "course_ar_title"     , with: nil
    fill_in "course_en_title"     , with: nil
    fill_in "course_description"  , with: nil
    fill_in "course_video_id"     , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "Something went wrong!")
  end
end

describe "update course", js: true do
  let(:course) { build(:course) }
  before(:example) { visit edit_course_path(create(:course)) }

  it "succeeds with valid attribures" do
    fill_in "course_ar_title"     , with: course.ar_title
    fill_in "course_en_title"     , with: course.en_title
    fill_in "course_description"  , with: course.description
    select course.video_host.to_s , from: "course_video_host"
    fill_in "course_video_id"     , with: course.video_id
    check "course_premium"
    check "course_active"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "Course updated successfully!")
  end

  it "fails with invalid attributes" do
    fill_in "course_ar_title"     , with: nil
    fill_in "course_en_title"     , with: nil
    fill_in "course_description"  , with: nil
    select course.video_host.to_s , from: "course_video_host"
    fill_in "course_video_id"     , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "Something went wrong!")
  end
end

describe "delete course" do
  it "succeeds" do
    course = create(:course)
    visit course_path(course)
    page.driver.submit :delete, "/courses/#{course.id}", nil
    expect(page).not_to have_selector("#course_#{course.id}")
  end
end
