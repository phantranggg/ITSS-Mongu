Admin.create(
    email: "manager@example.com",
    password: "password",
    name: "admin",
    role: "admin",
)

num_categories = 5

for _ in 1..num_categories
    Category.create(name: Faker::Name.name)
end

num_products = Category.all.length * 50

for _ in 1..num_products
    Product.create(
        name: Faker::Name.name,
        price: rand( 1000 ),
        description: Faker::Lorem.sentence,
        category_id: (1..Category.all.length).to_a.sample,
        live: (rand < 0.5) ? true : false
    )
end