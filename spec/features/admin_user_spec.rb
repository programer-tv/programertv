require "rails_helper"

RSpec.describe "admin user" do
  before(:example) { signin(create(:admin)) }

  context "courses" do
    it "can view all courses" do
      create(:course, id: 1, active: false)
      create(:course, id: 2, active: true)
      create(:course, id: 3, active: true)
      create(:course, id: 4, active: false)
      visit courses_path
      expect(page).to have_selector("#course_1")
      expect(page).to have_selector("#course_2")
      expect(page).to have_selector("#course_3")
      expect(page).to have_selector("#course_4")
    end
  end

  context "articles" do
    it "can view all articles" do
      create(:article, id: 1, active: false)
      create(:article, id: 2, active: true)
      create(:article, id: 3, active: true)
      create(:article, id: 4, active: false)
      visit articles_path
      expect(page).to have_selector("#article_1")
      expect(page).to have_selector("#article_2")
      expect(page).to have_selector("#article_3")
      expect(page).to have_selector("#article_4")
    end
  end
end
