require "rails_helper"

RSpec.describe "admin create video", js: true do
  let(:video) { build(:video) }

  before(:example) do
    signin(create(:admin))
    visit videos_path
    click_on "add_new_video_link"
    # remove overlapping element
    page.execute_script("document.getElementById('video_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    attach_file "video_image"            , "app/assets/images/logo_bg_big.png"
    fill_in "video_ar_title"             , with: video.ar_title
    fill_in "video_en_title"             , with: video.en_title
    fill_in "video_instructor"           , with: video.instructor
    fill_in "video_duration"             , with: video.duration
    fill_in_ckeditor "video_description" , with: video.description
    select video.video_host.to_s        , from: "video_video_host"
    fill_in "video_video_id"             , with: video.video_id
    select video.level.to_s              , from: "video_level"
    check "video_premium"
    check "video_active"
    check "video_new"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم إنشاء الفيديو بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "video_image"            , nil
    fill_in "video_ar_title"             , with: nil
    fill_in "video_en_title"             , with: nil
    fill_in "video_instructor"           , with: nil
    fill_in "video_duration"             , with: nil
    fill_in_ckeditor "video_description" , with: nil
    fill_in "video_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin update video", js: true do
  let(:video) { build(:video) }

  before(:example) do
    signin(create(:admin))
    v = create(:video)
    visit videos_path
    click_on "video_#{v.id}"
    click_on "edit_video_link"
    # remove overlapping element
    page.execute_script("document.getElementById('video_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attribures" do
    attach_file "video_image"            , "app/assets/images/logo_bg_big.png"
    fill_in "video_ar_title"             , with: video.ar_title
    fill_in "video_en_title"             , with: video.en_title
    fill_in "video_instructor"           , with: video.instructor
    fill_in "video_duration"             , with: video.duration
    fill_in_ckeditor "video_description" , with: video.description
    select video.video_host.to_s         , from: "video_video_host"
    fill_in "video_video_id"             , with: video.video_id
    select video.level.to_s              , from: "video_level"
    check "video_premium"
    check "video_active"
    check "video_new"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم تعديل الفيديو بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "video_image"            , nil
    fill_in "video_ar_title"             , with: nil
    fill_in "video_en_title"             , with: nil
    fill_in "video_instructor"           , with: nil
    fill_in "video_duration"             , with: nil
    fill_in_ckeditor "video_description" , with: nil
    select video.video_host.to_s         , from: "video_video_host"
    fill_in "video_video_id"             , with: nil
    select video.level.to_s              , from: "video_level"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin delete video", js: true do
  it "succeeds" do
    signin(create(:admin))
    video = create(:video)
    visit videos_path
    click_on "video_#{video.id}"
    click_on "delete_video_link"
    sleep(1)            # must sleep to allow modal to appear
    click_on("نعم")
    expect(page).not_to have_selector("#video_#{video.id}")
  end
end
