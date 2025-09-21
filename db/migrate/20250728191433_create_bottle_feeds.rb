class CreateBottleFeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :bottle_feeds do |t|
      t.date :date
      t.time :time
      t.integer :ounces
      t.text :notes
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
