require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    it { should validate_presence_of(:ar_title) }
    it { should validate_uniqueness_of(:ar_title) }
    it { should validate_presence_of(:en_title) }
    it { should validate_uniqueness_of(:en_title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:content) }
  end
end
