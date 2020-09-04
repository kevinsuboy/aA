class GenderChange < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :sex, :gender
  end
end
