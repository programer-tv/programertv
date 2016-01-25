class Course < ActiveRecord::Base
  has_many :episodes, dependent: :destroy

	has_attached_file :image, styles: { original: "300x300" },
										default_url: "/images/original/missing.png"

  validates :ar_title,     presence: true
  validates :en_title,     presence: true,  uniqueness: true
  validates :description,  presence: true
  validates :video_host,   presence: true
  validates :video_id,     presence: true
	validates_attachment :image, presence: true, size: { in: 0..2.megabytes },
                       content_type: { content_type: %w(image/jpeg image/png) }

  def get_sequential_episodes
    episodes.order("sequence ASC")
  end
end
