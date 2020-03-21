class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.references :department, null: false, foreign_key: true
      t.integer :way_of_payment

      t.timestamps
    end
  end
end
