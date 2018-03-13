# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

                                        
user_array = []     

(1..2).each do |num|                                                       
  user_array <<  User.create!(name: "User#{num}", email: "user#{num}@user.com", password: "123456", password_confirmation: "123456")                 
end

(1..2).each do |num|                                                       
  user_array <<  User.create!(name: "User Admin#{num}", email: "useradmin#{num}@user.com", password: "123456", password_confirmation: "123456", role: 1)                 
end                                                                          

user_array.each do |user|                                            
  (1..2).each do |num|                                                    
    Post.create!(title: "Post#{num}", description: "Description#{num}", content: "Text#{num}", user_id: user.id)        
  end                                                                      
end      