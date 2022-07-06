class Post < ApplicationRecord
  has_one_attached :main_image

  validates :caption, presence: true
end
