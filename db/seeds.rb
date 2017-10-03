# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  unless User.all.present?
    # USERS
    u1 = User.new(email: 'user1@mail.com', password: User.digest('password'), is_admin: true)
    u1.save
    u2 = User.new(email: 'user2@mail.com', password: User.digest('password'))
    u2.save
  end

#   PHOTOGRAPHERS
  p1 = Photographer.new(full_name: "Daniela Grossmann", contact_email: "daniela.grossmann@gmail.com")
  p2 = Photographer.new(full_name: "Pablo Kohls", contact_email: "pablo.kohls@gmail.com")
  p1.save
  p2.save

  #   IMAGES
  #   for front page
  i1 = Image.new(url: 'https://farm5.staticflickr.com/4398/36024086344_d35a5b0766_k.jpg', title:'Keiko', photographer: p1, description: 'Some description about the content of the image.')
  i2 = Image.new(url: 'https://farm5.staticflickr.com/4379/36679713012_e057fac5f1_k.jpg', title:'Keiko', photographer: p1, description: 'Some other description')
  i1.save
  i2.save
end
