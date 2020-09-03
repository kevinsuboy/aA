# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create({"username"=> 'Picasso'})
user2 = User.create({"username"=> 'Beethoven'})
user3 = User.create({"username"=> 'Queen'})

art1 = Artwork.create({"title"=> "Mona Lisa", "image_url"=> "monalisasucks.io", "artist_id"=> user3.id})
art2 = Artwork.create({"title"=> "Pyramids of Giza", "image_url"=> "cubes.io", "artist_id"=> user2.id})
art3 = Artwork.create({"title"=> "The Kevin", "image_url"=> "kevin.io", "artist_id"=> user1.id})
art4 = Artwork.create({"title"=> "The Derek", "image_url"=> "derek.io", "artist_id"=> user1.id})

#artwork 1 shares
share1 = ArtworkShare.create({"artwork_id"=> art1.id, "viewer_id" => user2.id})
share2 = ArtworkShare.create({"artwork_id"=> art1.id, "viewer_id" => user1.id})
share3 = ArtworkShare.create({"artwork_id"=> art1.id, "viewer_id" => user3.id})

#artwork 2 shares
share4 = ArtworkShare.create({"artwork_id"=> art2.id, "viewer_id" => user1.id})
share5 = ArtworkShare.create({"artwork_id"=> art2.id, "viewer_id" => user3.id})

#artwork 3 shares
share6 = ArtworkShare.create({"artwork_id"=> art3.id, "viewer_id" => user2.id})

#artwork 4 shares
share7 = ArtworkShare.create({"artwork_id"=> art4.id, "viewer_id" => user2.id})
share8 = ArtworkShare.create({"artwork_id"=> art4.id, "viewer_id" => user3.id})





