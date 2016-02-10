class Article < ActiveRecord::Base
  validates :ar_title,  presence: true,  uniqueness: true
  validates :en_title,  presence: true,  uniqueness: true
  validates :author,    presence: true
  validates :content,   presence: true
end
