# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

Task.create(title: 'Buy groceries', due_date: Date.today + 3.days, completed: false)
Task.create(title: 'Finish project', due_date: Date.today + 1.week, completed: false)
Task.create(title: 'Call plumber', due_date: Date.today, completed: true)
# Add more seed records as needed
