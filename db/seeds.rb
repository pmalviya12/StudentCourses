# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Student.create(first_name: "Alex", last_name: "Chef",  address: "Pune", state: "Maharastra", age: 60)
Student.create(first_name: "John", last_name: "Doe",  address: "Pune", state: "Maharastra", age: 60)
Student.create(first_name: "Eva", last_name: "Chef",  address: "Ranchi", state: "SI", age: 50)


Student.all each do |s|
	s.blogs.create(title: "Blog", content: "Dummy Blog written by #{s.first_name}")
end

5.times do |i|
  Post.create!(title: "Post #{i}")
end

Post.all.each do |post|
  post.comments.create(title: "Comment for Post + #{post.id}")
end