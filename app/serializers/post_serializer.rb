# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :caption, :main_image

  def main_image
    if object.main_image.attached?
      {
        url: rails_blob_url(object.main_image)
      }
    end
  end
end
