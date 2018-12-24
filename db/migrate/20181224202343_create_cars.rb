class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name, null: false, length: 70
      t.integer :price, null: false
      t.date :publish_date, null: false
      t.text :description, null: false, length: 2000

      t.timestamps
    end
  end
end
