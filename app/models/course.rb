class Course < ActiveRecord::Base
  has_many :episodes, dependent: :destroy

  validates :ar_title,     presence: true,  uniqueness: true
  validates :en_title,     presence: true,  uniqueness: true
  validates :description,  presence: true
  validates :video_host,   presence: true
  validates :video_id,     presence: true
end
