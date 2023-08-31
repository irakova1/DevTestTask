class AddAutoIncrementIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :auto_increment_id, :integer
  end
end
