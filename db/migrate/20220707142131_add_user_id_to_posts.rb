# frozen_string_literal: true

class AddUserIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :creator_user_id, :integer
  end
end
