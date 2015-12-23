FactoryGirl.define do
  factory :course do
    ar_title    { FFaker::LoremAR.phrase }
    en_title    { FFaker::Lorem.phrase }
    description { FFaker::LoremAR.paragraphs.join(" ") }
    video_host  { %w(YouTube Wistia Vimeo).sample }
    video_id    { rand(99999..999999) }
    premium     true
    active      true
    image Rack::Test::UploadedFile.new("app/assets/images/anonymous.png",
                                       "image/png")
  end
end
