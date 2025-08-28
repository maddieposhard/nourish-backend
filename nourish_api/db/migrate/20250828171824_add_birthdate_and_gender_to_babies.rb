class AddBirthdateAndGenderToBabies < ActiveRecord::Migration[8.0]
  def change
    add_column :babies, :birthdate, :date
    add_column :babies, :gender, :string
  end
end
