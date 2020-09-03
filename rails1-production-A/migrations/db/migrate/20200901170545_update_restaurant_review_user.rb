class UpdateRestaurantReviewUser < ActiveRecord::Migration[5.2]
  def change
    # Restaurant
    rename_column :restaurants,:location,:address
    add_index :restaurants, :owner_id
    # User
    rename_column :users,:passkey,:password
    remove_column :users,:favorite_cuisine
  end
end
