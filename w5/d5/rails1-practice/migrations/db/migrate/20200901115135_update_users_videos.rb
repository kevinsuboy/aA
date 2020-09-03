class UpdateUsersVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos,:name,:title
    add_index :videos,:uploader_id

    rename_column :users, :email,:username
    remove_column :users,:bio
  end
end
