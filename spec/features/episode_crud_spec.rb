require "rails_helper"

RSpec.describe "admin create episode", js: true do
  let!(:course) { create(:course) }
  let(:episode) { build(:episode, course: course) }

  before(:example) do
    signin(create(:admin))
    visit courses_path
    click_on "course_#{course.id}"
    click_on "add_new_course_episode_link"
    # remove overlapping element
    page.execute_script("document.getElementById('episode_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    attach_file "episode_image"            , "app/assets/images/logo_bg_big.png"
    fill_in "episode_en_title"             , with: episode.en_title
    fill_in "episode_ar_title"             , with: episode.ar_title
    fill_in_ckeditor "episode_description" , with: episode.description
    fill_in "episode_sequence"             , with: episode.sequence
    select episode.video_host.to_s         , from: "episode_video_host"
    fill_in "episode_video_id"             , with: episode.video_id
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم إنشاء الحلقة بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "episode_image"            , nil
    fill_in "episode_en_title"             , with: nil
    fill_in "episode_ar_title"             , with: nil
    fill_in_ckeditor "episode_description" , with: nil
    fill_in "episode_sequence"             , with: nil
    fill_in "episode_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin update episode", js: true do
  let(:episode) { create(:episode) }

  before(:example) do
    signin(create(:admin))
    visit course_episode_path(episode.course, episode)
    click_on "edit_course_episode_link"
    # remove overlapping element
    page.execute_script("document.getElementById('episode_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    episode = build(:episode)
    attach_file "episode_image"            , "app/assets/images/logo_bg_big.png"
    fill_in "episode_en_title"             , with: episode.en_title
    fill_in "episode_ar_title"             , with: episode.ar_title
    fill_in_ckeditor "episode_description" , with: episode.description
    fill_in "episode_sequence"             , with: episode.sequence
    select episode.video_host.to_s         , from: "episode_video_host"
    fill_in "episode_video_id"             , with: episode.video_id
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم تعديل الحلقة بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "episode_image"            , nil
    fill_in "episode_en_title"             , with: nil
    fill_in "episode_ar_title"             , with: nil
    fill_in_ckeditor "episode_description" , with: nil
    fill_in "episode_sequence"             , with: nil
    fill_in "episode_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin delete episode", js: true do
  it "succeeds" do
    signin(create(:admin))
    episode = create(:episode)
    visit courses_path
    click_on "course_#{episode.course.id}"
    click_on "episode_#{episode.id}"
    click_on "delete_course_episode_link"
    sleep(1)            # must sleep to allow modal to appear
    click_on("نعم")
    expect(page).not_to have_selector("#episode_#{episode.id}")
  end
end
