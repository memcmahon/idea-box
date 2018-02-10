class Image < ApplicationRecord
  has_many :image_ideas
  has_many :ideas, through: :image_ideas
end
