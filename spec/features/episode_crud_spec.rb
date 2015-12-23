require "rails_helper"

describe "create episode", js: true do
  let(:episode) { build(:episode) }

  before(:example) do
    visit new_course_episode_path(episode.course)
    # remove overlapping element
    page.execute_script("document.getElementById('episode_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    attach_file "episode_image"            , "app/assets/images/anonymous.png"
    fill_in "episode_en_title"             , with: episode.en_title
    fill_in "episode_ar_title"             , with: episode.ar_title
    fill_in_ckeditor "episode_description" , with: episode.description
    fill_in "episode_sequence"             , with: episode.sequence
    select episode.video_host.to_s         , from: "episode_video_host"
    fill_in "episode_video_id"             , with: episode.video_id
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "Episode created successfully!")
  end

  it "fails with invalid attributes" do
    attach_file "episode_image"            , nil
    fill_in "episode_en_title"             , with: nil
    fill_in "episode_ar_title"             , with: nil
    fill_in_ckeditor "episode_description" , with: nil
    fill_in "episode_sequence"             , with: nil
    fill_in "episode_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "Something went wrong!")
  end
end

describe "update episode", js: true do
  let(:episode) { create(:episode) }

  before(:example) do
    visit edit_course_episode_path(episode.course, episode)
    # remove overlapping element
    page.execute_script("document.getElementById('episode_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    episode = build(:episode)
    attach_file "episode_image"            , "app/assets/images/anonymous.png"
    fill_in "episode_en_title"             , with: episode.en_title
    fill_in "episode_ar_title"             , with: episode.ar_title
    fill_in_ckeditor "episode_description" , with: episode.description
    fill_in "episode_sequence"             , with: episode.sequence
    select episode.video_host.to_s         , from: "episode_video_host"
    fill_in "episode_video_id"             , with: episode.video_id
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "Episode updated successfully!")
  end

  it "fails with invalid attributes" do
    attach_file "episode_image"            , nil
    fill_in "episode_en_title"             , with: nil
    fill_in "episode_ar_title"             , with: nil
    fill_in_ckeditor "episode_description" , with: nil
    fill_in "episode_sequence"             , with: nil
    fill_in "episode_video_id"             , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "Something went wrong!")
  end
end

describe "delete episode" do
  it "succeeds" do
    episode = create(:episode)
    visit course_episode_path(episode.course, episode)
    page.driver.submit :delete, "/courses/#{episode.course.id}" +
                                "/episodes/#{episode.id}", nil
    expect(page).not_to have_selector("#episode_#{episode.id}")
  end
end
