class MakeCaptionNotNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :caption, false
  end
end
