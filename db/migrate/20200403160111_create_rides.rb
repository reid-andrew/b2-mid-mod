class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :name
      t.float :thrill
      t.references :park, foreign_key: true
      t.timestamps
    end
  end
end
