class RenameBirthdate < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :birthday, :birth_date
  end
end
