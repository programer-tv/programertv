require "rails_helper"

describe "create episode" do
  let(:episode) { build(:episode) }
  before(:example) { visit new_course_episode_path(episode.course) }

  it "succeeds with valid attributes" do
    fill_in "episode_en_title"     , with: episode.en_title
    fill_in "episode_ar_title"     , with: episode.ar_title
    fill_in "episode_description"  , with: episode.description
    fill_in "episode_sequence"     , with: episode.sequence
    select episode.video_host.to_s , from: "episode_video_host"
    fill_in "episode_video_id"     , with: episode.video_id
    click_on "Create Episode"
    expect(page).to have_text(episode.en_title)
  end

  it "fails with invalid attributes" do
    fill_in "episode_en_title"     , with: nil
    fill_in "episode_ar_title"     , with: nil
    fill_in "episode_description"  , with: nil
    fill_in "episode_sequence"     , with: nil
    fill_in "episode_video_id"     , with: nil
    click_on "Create Episode"
    expect(page).to have_text("can't be blank")
  end
end

describe "update episode" do
  let(:episode) { create(:episode) }
  before(:example) { visit edit_course_episode_path(episode.course, episode) }

  it "succeeds with valid attributes" do
    episode = build(:episode)
    fill_in "episode_en_title"     , with: episode.en_title
    fill_in "episode_ar_title"     , with: episode.ar_title
    fill_in "episode_description"  , with: episode.description
    fill_in "episode_sequence"     , with: episode.sequence
    select episode.video_host.to_s , from: "episode_video_host"
    fill_in "episode_video_id"     , with: episode.video_id
    click_on "Update Episode"
    expect(page).to have_text(episode.en_title)
  end

  it "fails with invalid attributes" do
    fill_in "episode_en_title"     , with: nil
    fill_in "episode_ar_title"     , with: nil
    fill_in "episode_description"  , with: nil
    fill_in "episode_sequence"     , with: nil
    fill_in "episode_video_id"     , with: nil
    click_on "Update Episode"
    expect(page).to have_text("can't be blank")
  end
end

describe "delete episode" do
  it "succeeds" do
    episode = create(:episode)
    visit course_episode_path(episode.course, episode)
    page.driver.submit :delete,
                       "/courses/#{episode.course.id}/episodes/#{episode.id}",
                       {}
    expect(page).not_to have_text(episode.en_title)
  end
end
