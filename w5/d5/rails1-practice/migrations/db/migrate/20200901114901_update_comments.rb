class UpdateComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :body, false
    change_column_null :comments, :video_id, false
    change_column_null :comments, :commenter_id, false
    change_column_null :comments, :parent_comment_id, true
    change_column_null :comments, :created_at, false
    change_column_null :comments, :updated_at, false
    add_index :comments, :commenter_id
    add_index :comments, :parent_comment_id
  end
end
