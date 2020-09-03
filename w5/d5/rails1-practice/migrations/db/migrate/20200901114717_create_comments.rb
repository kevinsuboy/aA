class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :video_id
      t.integer :commenter_id
      t.integer :parent_comment_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
