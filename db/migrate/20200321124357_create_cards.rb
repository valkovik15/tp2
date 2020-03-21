class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :worktime
      t.date :day
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
