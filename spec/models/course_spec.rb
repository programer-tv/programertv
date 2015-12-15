require 'rails_helper'

describe Course, type: :model do
  describe "validations" do
    it { should validate_presence_of(:ar_title) }
    it { should validate_uniqueness_of(:ar_title) }
    it { should validate_presence_of(:en_title) }
    it { should validate_uniqueness_of(:en_title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:video_host) }
    it { should validate_presence_of(:video_id) }
  end
end
