Product.delete_all

10.times do |i|
  Product.create({
    name: Faker::Hipster.words(3).join(' '),
  #  photos: Faker::Avatar.image,
    description: Faker::Lorem.paragraphs(15).join(' '),
    price: rand(100)
  })
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
