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
   ["Couple clothes 1", "This is one clothes", 1],
   ["Couple clothes 2", "This is one clothes", 1],
   ["Couple clothes 3", "This is one clothes", 1],
   ["Couple clothes 4", "This is one clothes", 1],
   ["Couple clothes 5", "This is one clothes", 1],
   ["Couple clothes 6", "This is one clothes", 1],
   ["Couple clothes 7", "This is one clothes", 1],
   ["Couple clothes 8", "This is one clothes", 1],
   ["Easy Polo Christmas Edition", "Easy Polo Christmas Edition Description", 2],
   ["addidas New Hammer", "addidas New Hammer solefor Sports person", 2],
   ["Easy Polo Black Edition", "Easy Polo Black Edition Description", 2],
   ["Easy Polo Christmas Edition", "Easy Polo Christmas Edition Description", 2],
   ["Equipment 1", "This is an equipment", 3],
   ["Equipment 2", "This is an equipment", 3],
   ["Equipment 3", "This is an equipment", 3],
   ["Equipment 4", "This is an equipment", 3],
   ["Equipment 5", "This is an equipment", 3],
   ["Equipment 6", "This is an equipment", 3]
]

def img_url category_id
    case category_id
    when 1
        Rails.root.join("public/images/products/couple#{rand(1..8)}.jpg")
    when 2
        Rails.root.join("public/images/products/p#{rand(1..8)}.jpg")
    when 3
        Rails.root.join("public/images/products/gym#{rand(1..10)}.jpg")
    end
end

products.each do |name, description, category_id|
    Product.create(name: name, description: description, category_id: category_id,
                   images: Array.new(1) { img_url(category_id).open })
end

size = ['S','M','L','XL','XXL']
color = ['Red', 'Black', 'White', 'Blue', 'Yellow']
price = [10, 25, 50, 100, 200]

for product_id in Product.ids do
    i = 0
    while i < 10
        ProductFeature.create(product_id: product_id, size: size.sample, color: color.sample,
                              gender: rand(2), price: price.sample + 50000 * rand(10),
                              quantity: rand(2..5))
        i += 1
    end
end