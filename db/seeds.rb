# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
    Income.create(
        category: "給与",
        price: Faker::Number.between(from: 1, to: 10000),
        date: Faker::Date.in_date_period,
        memo: Faker::Job.field
     )
end