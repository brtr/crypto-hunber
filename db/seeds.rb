# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.create(name: "SunFlower", desc: "SunFlower offer", count: 10, reward: 10, status: "avaliable", logo: "sunflower.png", website: "https://sunflower-land.com/")
Offer.create(name: "Opensea", desc: "Opensea offer", count: 10, reward: 10, status: "avaliable", logo: "opensea.png", website: "https://opensea.io/")
Offer.create(name: "Sushiswap", desc: "Sushiswap offer", count: 10, reward: 10, status: "avaliable", logo: "sushiswap.png", website: "https://app.sushi.com/pool")
Offer.create(name: "ENS", desc: "ENS offer", count: 10, reward: 10, status: "avaliable", logo: "ens.png", website: "https://app.ens.domains/")