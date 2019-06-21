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
Status.create(name:"В наявності")
Status.create(name:"Ваш варіант 1")
Status.create(name:"Не привезли")
Status.create(name:"Ваш варіант 2")
