FactoryGirl.define do
  factory :episode do
    en_title            { FFaker::Lorem.phrase }
    ar_title            { FFaker::LoremAR.phrase }
    description         { FFaker::LoremAR.paragraphs.join(" ") }
    sequence(:sequence) { |n| n }
    video_host          { %w(YouTube Wistia Vimeo).sample }
    video_id            { rand(99999..999999) }
    course
    image Rack::Test::UploadedFile.new("app/assets/images/anonymous.png",
                                       "image/png")
  end
end
