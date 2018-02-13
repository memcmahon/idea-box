class Image < ApplicationRecord
  validates_presence_of :url, :alt_tag

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
