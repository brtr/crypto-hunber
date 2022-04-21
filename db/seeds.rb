# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.create(name: "Sirius", desc: "Sirius Finance offer", count: 10, reward: 10, status: "avaliable", logo: "sirius.png", website: "https://app.sirius.finance/#/pools", chain: "astar", cost: 0)
Offer.create(name: "Tofu", desc: "Tofu NFT offer", count: 10, reward: 10, status: "avaliable", logo: "tofu.png", website: "https://tofunft.com/astar", chain: "astar", cost: 0)
Offer.create(name: "Versa", desc: "Versa Finance offer", count: 10, reward: 10, status: "avaliable", logo: "versa.png", website: "https://versa.finance/pool", chain: "astar", cost: 0)
Offer.create(name: "Degens", desc: "Astar Degens offer", count: 10, reward: 10, status: "avaliable", logo: "degens.png", website: "https://www.astardegens.com/", chain: "astar", cost: 0)
Offer.create(name: "Exchange", desc: "Astar Exchange offer", count: 10, reward: 10, status: "avaliable", logo: "astarexchange.png", website: "https://astar.exchange/exchange/pool", chain: "astar", cost: 0)
Offer.create(name: "Punks", desc: "Astar Punks offer", count: 10, reward: 10, status: "avaliable", logo: "punks.png", website: "https://astarpunks.com/", chain: "astar", cost: 0)
