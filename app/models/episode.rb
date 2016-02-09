class Episode < ActiveRecord::Base
  belongs_to :course

	has_attached_file :image, styles: { original: "120x90>" },
										default_url: "/images/original/missing.png"

  extend FriendlyId
  friendly_id :en_title, use: :scoped, scope: :course

  validates :en_title    , presence: true , uniqueness: { scope: :course_id }
  validates :ar_title    , presence: true , uniqueness: { scope: :course_id }
  validates :description , presence: true
  validates :sequence    , presence: true , numericality: { greater_than: 0 } ,
                           uniqueness: { scope: :course_id }
  validates :video_host  , presence: true
  validates :video_id    , presence: true
  validates :slug, presence: true, uniqueness: { scope: :course_id }
	validates_attachment :image, presence: true, size: { in: 0..2.megabytes },
                       content_type: { content_type: %w(image/jpeg image/png) }
end
