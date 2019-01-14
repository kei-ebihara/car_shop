class AddGenresIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :genre, foreign_key: true, index: true, after: :description
  end
end
