FactoryGirl.define do
  factory :article do
    en_title    { FFaker::Lorem.phrase }
    ar_title    { FFaker::LoremAR.phrase }
    author      { FFaker::Name.name }
    content     { FFaker::LoremAR.paragraphs.join(" ") }
    active      true
    image Rack::Test::UploadedFile.new("app/assets/images/logo_bg_big.png",
                                       "image/png")
  end
end
