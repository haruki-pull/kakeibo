# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
    Income.create([{category: 'money'}, {price: '1000'},{date: 'Wed, 18 Nov 2015'},{memo: '簡単じゃないか'}])
end