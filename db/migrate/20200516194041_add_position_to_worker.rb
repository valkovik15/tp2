class AddPositionToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :position, :string
  end
end
