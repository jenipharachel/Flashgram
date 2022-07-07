# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :main_image
  belongs_to :creator_user_id, class_name: User, foreign_key: "creator_user_id"

  validates :caption, presence: true
end
