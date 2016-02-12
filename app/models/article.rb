class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :en_title, use: :slugged

	has_attached_file :image, styles: { original: "200x200" },
										default_url: "/images/original/missing.png"

  validates :ar_title,  presence: true,  uniqueness: true
  validates :en_title,  presence: true,  uniqueness: true
  validates :author,    presence: true
  validates :content,   presence: true
  validates :slug,      presence: true,  uniqueness: true
	validates_attachment :image, presence: true, size: { in: 0..2.megabytes },
                       content_type: { content_type: %w(image/jpeg image/png) }

  def self.get_articles(user)
    if user.admin?
      Article.all.order("created_at DESC")
    else
      Article.where(active: true).order("created_at DESC")
    end
  end

  def should_generate_new_friendly_id?
    en_title_changed?
  end
end
