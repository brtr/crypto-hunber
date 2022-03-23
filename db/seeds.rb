# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Offer.create(name: "YuzuSwap", desc: "YuzuSwap offer", count: 10, reward: 10, status: "avaliable", logo: "yuzuswap.jpeg", website: "https://app.yuzu-swap.com/", chain: "oasis", cost: 0)
Offer.create(name: "ValleySwap", desc: "ValleySwap offer", count: 10, reward: 10, status: "avaliable", logo: "valleyswap.svg", website: "https://dex.valleyswap.com/#/pool", chain: "oasis", cost: 0)
Offer.create(name: "ONS", desc: "Oasis Name Service offer", count: 10, reward: 10, status: "avaliable", logo: "ons.png", website: "https://app.ons.money/", chain: "oasis", cost: 0)
Offer.create(name: "Fountain", desc: "Fountain offer", count: 10, reward: 10, status: "avaliable", logo: "fountain.png", website: "https://ftp.cash/dashboard/", chain: "oasis", cost: 0)
Offer.create(name: "Lizard", desc: "Lizard offer", count: 10, reward: 10, status: "avaliable", logo: "lizard.png", website: "https://app.lizard.exchange/pool", chain: "oasis", cost: 0)
Offer.create(name: "Tofu", desc: "Tofu NFT offer", count: 10, reward: 10, status: "avaliable", logo: "tofu.png", website: "https://tofunft.com/oasis", chain: "oasis", cost: 0)
