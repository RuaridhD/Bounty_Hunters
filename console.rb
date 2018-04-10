require("pry-byebug")
require_relative("./models/bounty_class.rb")

BountyHunter.delete_all()

hunted1 = BountyHunter.new({
  "name" => "Duane Chapman",
  "species" => "Human",
  "bounty_value" => 10000,
  "favourite_weapon" => "Lasso"
})

hunted1.save()

hunted2 = BountyHunter.new({
  "name" => "Luke Skywalker",
  "species" => "Jedi",
  "bounty_value" => 1000000,
  "favourite_weapon" => "Lightsaber"
})

hunted2.save()

binding.pry
nil
