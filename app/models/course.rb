class Course < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:ar_title, :en_title]

  include ActionView::Helpers::DateHelper

  has_many :episodes, dependent: :destroy

	has_attached_file :image, styles: { original: "200x200" },
										default_url: "/images/original/missing.png"

  extend FriendlyId
  friendly_id :en_title, use: :slugged

  validates :ar_title,     presence: true
  validates :en_title,     presence: true,  uniqueness: true
  validates :instructor,   presence: true
  validates :description,  presence: true
  validates :video_host,   presence: true
  validates :video_id,     presence: true
  validates :slug,         presence: true,  uniqueness: true
	validates_attachment :image, presence: true, size: { in: 0..2.megabytes },
                       content_type: { content_type: %w(image/jpeg image/png) }

  def get_sequential_episodes
    episodes.order("sequence ASC")
  end

  def duration
    if episodes.any?
      distance_of_time_in_words(episodes.map(&:duration).sum)
    else
      distance_of_time_in_words(0)
    end
  end

  def self.get_courses(user)
    if user.admin?
      Course.all.order("created_at DESC")
    else
      Course.where(active: true).order("created_at DESC")
    end
  end

  def should_generate_new_friendly_id?
    en_title_changed?
  end
end
