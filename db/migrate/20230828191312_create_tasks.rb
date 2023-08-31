class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed
      t.string :due_date
      t.string :date

      t.timestamps
    end
  end
end
