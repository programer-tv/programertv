FactoryGirl.define do
  factory :article do
    en_title    { FFaker::Lorem.phrase }
    ar_title    { FFaker::LoremAR.phrase }
    author      { FFaker::Name.name }
    content     { FFaker::LoremAR.paragraphs.join(" ") }
    active      true
  end
end
