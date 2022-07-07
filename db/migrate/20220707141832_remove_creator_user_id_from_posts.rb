# frozen_string_literal: true

class RemoveCreatorUserIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :posts, :user, foreign_key: true
  end
end
