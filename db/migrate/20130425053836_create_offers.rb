class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :person_id
      t.integer :school_id
      t.string :ip

      t.timestamps
    end
    add_index :offers, :person_id
    add_index :offers, :school_id
    add_index :offers, [:person_id, :school_id], unique: true
  end
end
