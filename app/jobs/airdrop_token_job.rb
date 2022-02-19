class AirdropTokenJob < ApplicationJob
  queue_as :default

  def perform(offer_id, address, amount)
    puts "Start at #{Time.now}"
    puts "Offer ##{offer_id} send reward #{amount} to #{address}"

    airdrop(address, amount)

    puts "End at #{Time.now}"
  end

  def airdrop(address, amount)
    contract = set_contract
    contract.transact_and_wait.air_drop(address, amount.to_i)
  end

  def set_contract
    client = Ethereum::HttpClient.new(ENV["RPC_URL"])
    contract = Ethereum::Contract.create(name: ENV["REWARD_CONTRACT_NAME"], address: ENV["REWARD_CONTRACT_ADDRESS"], abi: ENV["REWARD_CONTRACT_ABI"], client: client)
    key = Eth::Key.new(priv: ENV["PRIVATE_KEY"])
    contract.key = key

    contract
  end
end