FactoryGirl.define do
  factory :course do
    ar_title    { FFaker::LoremAR.phrase }
    en_title    { FFaker::Lorem.phrase }
    instructor  { FFaker::Name.name }
    description { FFaker::LoremAR.paragraphs.join(" ") }
    video_host  { %w(YouTube Wistia Vimeo).sample }
    video_id    { rand(99999..999999) }
    level       { %w(Beginner Intermediate Advanced).sample }
    premium     true
    active      true
    new         true
    image Rack::Test::UploadedFile.new("app/assets/images/logo_bg_big.png",
                                       "image/png")
  end
end
