# frozen_string_literal: true

class AddForeignKeyToTask < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :users, column: :creator_user_id
  end
end
