# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  unless User.all.present?
    u = User.new(email: 'user@mail.com', digest: 'password', is_admin: true)
    u.save
  end
#   IMAGES
#   for front page
  i1 = Image.new(url: 'https://farm5.staticflickr.com/4398/36024086344_d35a5b0766_k.jpg', title:'Keiko', photographer: 'Daniela Grossmann', description: 'some description')
  i2 = Image.new(url: 'https://farm5.staticflickr.com/4379/36679713012_e057fac5f1_k.jpg', title:'Keiko', photographer: 'Daniela Grossmann', description: 'some description')
  i1.save
  i2.save
end
