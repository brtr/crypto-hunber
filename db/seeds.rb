# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.create(name: "SunFlower", desc: "SunFlower offer", count: 10, reward: 10, status: "avaliable", logo: "sunflower.png", website: "https://sunflower-land.com/", chain: "matic")
Offer.create(name: "Opensea", desc: "Opensea offer", count: 10, reward: 10, status: "avaliable", logo: "opensea.png", website: "https://opensea.io/", chain: "eth")
Offer.create(name: "Sushiswap", desc: "Sushiswap offer", count: 10, reward: 10, status: "avaliable", logo: "sushiswap.png", website: "https://app.sushi.com/pool", chain: "matic")
Offer.create(name: "ENS", desc: "ENS offer", count: 10, reward: 10, status: "avaliable", logo: "ens.png", website: "https://app.ens.domains/", chain: "eth")
Offer.create(name: "Uniswap", desc: "Uniswap offer", count: 10, reward: 10, status: "avaliable", logo: "uniswap.png", website: "https://app.uniswap.org/#/pool", chain: "eth")
Offer.create(name: "TradeJoe", desc: "TradeJoe offer", count: 10, reward: 10, status: "avaliable", logo: "tradejoe.png", website: "https://traderjoexyz.com/pool", chain: "avax")
Offer.create(name: "Pangolin", desc: "Pangolin offer", count: 10, reward: 10, status: "avaliable", logo: "pangolin.png", website: "https://app.pangolin.exchange/#/pool", chain: "avax")
Offer.create(name: "Spookyswap", desc: "Spookyswap offer", count: 10, reward: 10, status: "avaliable", logo: "spookyswap.png", website: "https://spookyswap.finance/add", chain: "fantom")
Offer.create(name: "Lido", desc: "Lido offer", count: 10, reward: 10, status: "avaliable", logo: "lido.png", website: "https://stake.lido.fi/", chain: "eth")