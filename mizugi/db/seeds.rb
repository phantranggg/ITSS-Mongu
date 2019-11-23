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
   ["Easy Polo Christmas Edition", "Easy Polo Christmas Edition Description", 1],
   ["addidas New Hammer solefor Sports person", "addidas New Hammer solefor Sports person", 2],
   ["Easy Polo Black Edition", "Easy Polo Black Edition Description", 3],
   ["Easy Polo Christmas Edition", "Easy Polo Christmas Edition Description", 1],
]

products.each do |name, description, category_id, quantity|
    Product.create(name: name, description: description, category_id: category_id)
end

product_features = [
    [1,'M','#FFFFFF',0,100.00,5],
    [1,'L','#FFFFFF',0,100.00,5],
    [1,'M','#000000',0,100.00,5],
    [1,'L','#000000',0,100.00,5],
    [1,'M','#FFFFFF',1,100.00,5],
    [1,'L','#FFFFFF',1,100.00,5],
    [1,'M','#000000',1,100.00,5],
    [1,'L','#000000',1,100.00,5],
    
    [2,'M','#FFFFFF',0,100.00,5],
    [2,'L','#FFFFFF',0,100.00,5],
    [2,'M','#000000',0,100.00,5],
    [2,'L','#000000',0,100.00,5],
    [2,'M','#FFFFFF',1,100.00,5],
    [2,'L','#FFFFFF',1,100.00,5],
    [2,'M','#000000',1,100.00,5],
    [2,'L','#000000',1,100.00,5],
    
    [3,'M','#FFFFFF',0,100.00,5],
    [3,'L','#FFFFFF',0,100.00,5],
    [3,'M','#000000',0,100.00,5],
    [3,'L','#000000',0,100.00,5],
    [3,'M','#FFFFFF',1,100.00,5],
    [3,'L','#FFFFFF',1,100.00,5],
    [3,'M','#000000',1,100.00,5],
    [3,'L','#000000',1,100.00,5],
    
    [4,'M','#FFFFFF',0,100.00,5],
    [4,'L','#FFFFFF',0,100.00,5],
    [4,'M','#000000',0,100.00,5],
    [4,'L','#000000',0,100.00,5],
    [4,'M','#FFFFFF',1,100.00,5],
    [4,'L','#FFFFFF',1,100.00,5],
    [4,'M','#000000',1,100.00,5],
    [4,'L','#000000',1,100.00,5]
]

product_features.each do |product_id, size, color, gender, price, quantity|
    ProductFeature.create(product_id: product_id, size: size, color: color, gender: gender, price: price, quantity: quantity)
end