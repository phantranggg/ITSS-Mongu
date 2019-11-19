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
   "Equipment"
]

categories.each do |name|
    Category.create(name: name)
end
