class Episode < ActiveRecord::Base
  belongs_to :course

  validates :en_title    , presence: true , uniqueness: { scope: :course_id }
  validates :ar_title    , presence: true , uniqueness: { scope: :course_id }
  validates :description , presence: true
  validates :sequence    , presence: true , numericality: { greater_than: 0 } ,
                           uniqueness: { scope: :course_id }
  validates :video_host  , presence: true
  validates :video_id    , presence: true
end
