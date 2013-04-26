class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :ranking
      t.string :name
      t.string :city
      t.string :state
      t.decimal :lat
      t.decimal :lon
      t.string :tuition
      t.integer :enrollment
      t.string :accept_rate
      t.string :retention_rate
      t.string :graduation_rate
      t.string :group
    end
  end
end
