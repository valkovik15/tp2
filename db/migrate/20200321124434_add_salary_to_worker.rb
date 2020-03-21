class AddSalaryToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :salary, :integer
  end
end
