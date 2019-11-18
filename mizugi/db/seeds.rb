Admin.create(
    email: "manager@example.com",
    password: "password",
    name: "admin",
    role: "admin",
)

User.create(
    email: "foo@example.com",
    password: "foobaz"
)

categories = [
   "Clothes",
   "Shoes",
   "Equipment"
]

categories.each do |name|
    Category.create(name: name)
end

products = [
   ["Easy Polo Black Edition", 100000, "Easy Polo Black Edition Description", 1, 5],
   ["Easy Polo Black Edition", 120000, "Easy Polo Black Edition Description", 2, 3],
   ["Easy Polo Black Edition", 130000, "Easy Polo Black Edition Description", 3, 2],
   ["Easy Polo Black Edition", 140000, "Easy Polo Black Edition Description", 1, 7],
   ["Easy Polo Black Edition", 150000, "Easy Polo Black Edition Description", 2, 8],
   ["Easy Polo Black Edition", 160000, "Easy Polo Black Edition Description", 3, 6]
]

products.each do |name, price, description, category_id, quantity|
    Product.create(name: name, price: price, description: description, category_id: category_id, quantity: quantity)
end
