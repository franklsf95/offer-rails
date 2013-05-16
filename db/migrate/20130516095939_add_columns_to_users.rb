class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name     , :string
    add_column :users, :class_id , :integer
    add_column :users, :alt_email, :string
    add_column :users, :cell_cn  , :string
    add_column :users, :cell_us  , :string
    add_column :users, :person_id, :integer
  end
end
