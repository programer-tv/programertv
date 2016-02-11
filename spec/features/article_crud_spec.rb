require "rails_helper"

RSpec.describe "admin create article", js: true do
  let(:article) { build(:article) }

  before(:example) do
    signin(create(:admin))
    visit articles_path
    click_on "add_new_article_link"
    # remove overlapping element
    page.execute_script("document.getElementById('article_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attributes" do
    attach_file "article_image"        , "app/assets/images/logo_bg_big.png"
    fill_in "article_ar_title"         , with: article.ar_title
    fill_in "article_en_title"         , with: article.en_title
    fill_in "article_author"           , with: article.author
    fill_in_ckeditor "article_content" , with: article.content
    check "article_active"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم إنشاء المقال بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "article_image"        , nil
    fill_in "article_ar_title"         , with: nil
    fill_in "article_en_title"         , with: nil
    fill_in "article_author"           , with: nil
    fill_in_ckeditor "article_content" , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin update article", js: true do
  let(:article) { build(:article) }

  before(:example) do
    signin(create(:admin))
    a = create(:article)
    visit articles_path
    click_on "article_#{a.id}"
    click_on "edit_article_link"
    # remove overlapping element
    page.execute_script("document.getElementById('article_image')." +
                        "style.position = 'relative';")
  end

  it "succeeds with valid attribures" do
    attach_file "article_image"        , "app/assets/images/logo_bg_big.png"
    fill_in "article_ar_title"         , with: article.ar_title
    fill_in "article_en_title"         , with: article.en_title
    fill_in "article_author"           , with: article.author
    fill_in_ckeditor "article_content" , with: article.content
    check "article_active"
    click_on "submit"
    expect(page).to have_selector(".sweet-alert",
                                  text: "تم تعديل المقال بنجاح.")
  end

  it "fails with invalid attributes" do
    attach_file "article_image"        , nil
    fill_in "article_ar_title"         , with: nil
    fill_in "article_en_title"         , with: nil
    fill_in "article_author"           , with: nil
    fill_in_ckeditor "article_content" , with: nil
    click_on "submit"
    expect(page).to have_selector(".sweet-alert", text: "هناك خطأ ما!")
  end
end

RSpec.describe "admin delete article", js: true do
  it "succeeds" do
    signin(create(:admin))
    article = create(:article)
    visit articles_path
    click_on "article_#{article.id}"
    click_on "delete_article_link"
    sleep(1)            # must sleep to allow modal to appear
    click_on("نعم")
    expect(page).not_to have_selector("#article_#{article.id}")
  end
end
