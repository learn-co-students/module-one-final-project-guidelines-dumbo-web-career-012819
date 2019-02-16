require_relative '../config/environment'

# prompt = TTY::Prompt.new

genre = ["Painting", "Sculpture", "Ceramic"]

User.delete_all
Gallery.delete_all
Artwork.delete_all
UserArtwork.delete_all

User.create(username: "link04", password: "123456")

5.times do
  User.create(username: Faker::Alphanumeric.unique.alpha(10).downcase, password: Faker::Alphanumeric.alphanumeric(10).downcase)
end

5.times do
  Gallery.create(name: Faker::FunnyName.unique.name, location: Faker::Address.city)
end

20.times do
  Artwork.create(title: Faker::FunnyName.unique.name, price: Faker::Number.between(500, 10000), genre: genre.sample, gallery_id: Gallery.all.sample.id)
end

10.times do
  UserArtwork.create(user_id: User.pluck(:id).sample, artwork_id: Artwork.pluck(:id).sample, sold: false)
end
