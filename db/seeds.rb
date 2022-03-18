# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.create(name: "Raydium", desc: "Raydium offer", count: 10, reward: 10, status: "avaliable", logo: "raydium.jpeg", website: "https://raydium.io/pools/", chain: "solana", cost: 0)
Offer.create(name: "Saber", desc: "Saber offer", count: 10, reward: 10, status: "avaliable", logo: "saber.svg", website: "https://app.saber.so/#/swap", chain: "solana", cost: 0)
Offer.create(name: "Solend", desc: "Solend offer", count: 10, reward: 10, status: "avaliable", logo: "solend.png", website: "https://solend.fi/dashboard", chain: "solana", cost: 0)
Offer.create(name: "Solanart", desc: "Solanart offer", count: 10, reward: 10, status: "avaliable", logo: "solanart.png", website: "https://solanart.io/", chain: "solana", cost: 0)
