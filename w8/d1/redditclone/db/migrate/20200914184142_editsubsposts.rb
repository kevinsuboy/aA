class Editsubsposts < ActiveRecord::Migration[6.0]
  def change
    # SUBS
    add_column :subs, :title, :string, null: false
    add_column :subs, :description, :string, null: false
    add_column :subs, :user_id, :string, null: false
    add_index :subs, :user_id

    #POSTS
    add_column :posts, :title,   :string, null: false
    add_column :posts, :url,     :string, unique: true, null: false
    add_column :posts, :content, :string,  null: false
    add_column :posts, :sub_id,  :integer,   null: false
    add_column :posts, :user_id, :integer,  null: false
    add_index :posts, :user_id
    add_index :posts, :sub_id

  end
end
