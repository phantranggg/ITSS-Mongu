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
