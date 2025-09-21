class CreateFeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :feeds do |t|
      t.date :date
      t.time :time
      t.integer :length
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
