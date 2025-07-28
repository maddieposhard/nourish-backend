class CreatePumps < ActiveRecord::Migration[8.0]
  def change
    create_table :pumps do |t|
      t.date :date
      t.time :time
      t.integer :length
      t.integer :ounces
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
