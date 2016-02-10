class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :en_title, use: :slugged

  validates :ar_title,  presence: true,  uniqueness: true
  validates :en_title,  presence: true,  uniqueness: true
  validates :author,    presence: true
  validates :content,   presence: true

  def should_generate_new_friendly_id?
    en_title_changed?
  end
end
