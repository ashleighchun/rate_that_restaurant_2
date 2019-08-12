# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create(name:"Lucky's", location: "110 Main St", cuisine: "Comfort Food")
Restaurant.create(name:"Sam's Club", location: "100 Side St", cuisine: "Diner")
Restaurant.create(name:"Taco Truck", location: "200 Back St", cuisine: "Fast Food")


Review.create(restaurant_id: 1, user_id: 1, content:"good 1", rating: 5, title: "very yummy", price: "$$")
Review.create(restaurant_id: 1, user_id: 2, content:"good 2", rating: 4, title: "pretty yummy", price: "$$")
Review.create(restaurant_id: 1, user_id: 3, content:"good 3", rating: 3, title: "yummy", price: "$$")

Review.create(restaurant_id: 2, user_id: 1, content:"decent 1", rating: 4, title: "not bad", price: "$$$")
Review.create(restaurant_id: 2, user_id: 2, content:"decent 2", rating: 3, title: "could be worse", price: "$$$")
Review.create(restaurant_id: 2, user_id: 3, content:"decent 3", rating: 2, title: "could be better", price: "$$$")

Review.create(restaurant_id: 3, user_id: 1, content:"ok 1", rating: 3, title: "so so", price: "$")
Review.create(restaurant_id: 3, user_id: 2, content:"ok 2", rating: 2, title: "meh", price: "$")
Review.create(restaurant_id: 3, user_id: 3, content:"ew 3", rating: 1, title: "yuck", price: "$")
