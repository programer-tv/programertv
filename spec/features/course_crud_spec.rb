require "rails_helper"

RSpec.describe "admin create course", js: true do
  let(:course) { build(:course) }

  before(:example) do
    signin(create(:admin))
    visit courses_path
    click_on "add_new_course_link"
    # remove overlapping element
    page.execute_script("document.getElementById('course_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    attach_file "course_image"            , "app/assets/images/logo_bg_big.png"
    fill_in "course_ar_title"             , with: course.ar_title
    fill_in "course_en_title"             , with: course.en_title
    fill_in "course_instructor"           , with: course.instructor
    fill_in_ckeditor "course_description" , with: course.description
    select course.video_host.to_s         , from: "course_video_host"
    fill_in "course_video_id"             , with: course.video_id
    check "course_premium"
    check "course_active"
    check "course_new"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم إنشاء الدورة بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "course_image"            , nil
    fill_in "course_ar_title"             , with: nil
    fill_in "course_en_title"             , with: nil
    fill_in "course_instructor"           , with: nil
    fill_in_ckeditor "course_description" , with: nil
    fill_in "course_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin update course", js: true do
  let(:course) { build(:course) }

  before(:example) do
    signin(create(:admin))
    c = create(:course)
    visit courses_path
    click_on "course_#{c.id}"
    click_on "edit_course_link"
    # remove overlapping element
    page.execute_script("document.getElementById('course_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attribures" do
    attach_file "course_image"            , "app/assets/images/logo_bg_big.png"
    fill_in "course_ar_title"             , with: course.ar_title
    fill_in "course_en_title"             , with: course.en_title
    fill_in "course_instructor"           , with: course.instructor
    fill_in_ckeditor "course_description" , with: course.description
    select course.video_host.to_s         , from: "course_video_host"
    fill_in "course_video_id"             , with: course.video_id
    check "course_premium"
    check "course_active"
    check "course_new"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم تعديل الدورة بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "course_image"            , nil
    fill_in "course_ar_title"             , with: nil
    fill_in "course_en_title"             , with: nil
    fill_in "course_instructor"           , with: nil
    fill_in_ckeditor "course_description" , with: nil
    select course.video_host.to_s         , from: "course_video_host"
    fill_in "course_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin delete course", js: true do
  it "succeeds" do
    signin(create(:admin))
    course = create(:course)
    visit courses_path
    click_on "course_#{course.id}"
    click_on "delete_course_link"
    sleep(1)            # must sleep to allow modal to appear
    click_on("نعم")
    expect(page).not_to have_selector("#course_#{course.id}")
  end
end
