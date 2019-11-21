ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  # ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

Admin.create(
    email: "manager@example.com",
    password: "password",
    name: "admin",
    role: "admin",
)

user = User.new(
    email: "foo@example.com",
    password: "foobaz",
    password_confirmation: "foobaz"
)
user.skip_confirmation!
user.save!

categories = [
   "Clothes",
   "Shoes",
   "Equipments"
]

categories.each do |name|
    Category.create(name: name)
end
  
products = [
   ["Easy Polo Christmas Edition", "Easy Polo Christmas Edition Description", 2],
   ["addidas New Hammer", "addidas New Hammer solefor Sports person", 2],
   ["Easy Polo Black Edition", "Easy Polo Black Edition Description", 2],
   ["Easy Polo Christmas Edition", "Easy Polo Christmas Edition Description", 2],
]

products.each do |name, description, category_id|
    Product.create(name: name, description: description, category_id: category_id)
end

size = ['S','M','L','XL','XXL']
color = ['#FFFFFF', '#000000']
price = [20000, 50000, 100000, 200000, 500000]

for product_id in Product.ids do
    i = 0
    while i < 10
        ProductFeature.create(product_id: product_id, size: size.sample, color: color.sample,
                              gender: rand(2), price: price.sample + 50000 * rand(10),
                              quantity: rand(2..5))
        i += 1
    end
end