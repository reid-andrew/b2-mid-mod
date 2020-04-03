class CreatePark < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.float :admission
      t.timestamps
    end
  end
end
