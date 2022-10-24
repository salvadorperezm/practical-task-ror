class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.integer :age
      t.integer :shirt_number
      t.string :position
      t.string :weight
      t.string :height

      t.timestamps
    end
  end
end
