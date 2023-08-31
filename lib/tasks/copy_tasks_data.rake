# lib/tasks/copy_tasks_data.rake
namespace :db do
    desc 'Copy data from tasks to tasks with auto-increment id'
    task copy_tasks_data: :environment do
      old_tasks = Task.all
      old_tasks.each do |old_task|
        new_task = Task.new(title: old_task.title, due_date: old_task.due_date, completed: old_task.completed)
        new_task.save
      end
    end
  end
  