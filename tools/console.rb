require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("Facebook", "Mark Z", "https://facebook.com")
tesla = Startup.new("Tesla", "Elon Musk", "Tesla.com")
pied_piper = Startup.new("Pied Piper", "Richard Hendricks", "PiedPiper.com" )
space_x = Startup.new("Space X", "Elon Musk", "SpaceX.com")

accel = VentureCapitalist.new("Accel", 3123)
sequoia = VentureCapitalist.new("Sequoia Capital", 12362332327)
taco_bell = VentureCapitalist.new("T-Bell", 1000000000)



money_1 = FundingRound.new(facebook, sequoia, "Pre-Seed", 1)
money_2 = FundingRound.new(pied_piper, accel, "Series-D", 1)
money_3 = FundingRound.new(tesla, accel, "Series-B", 1)
money_4 = FundingRound.new(tesla, accel, "Series-B", 1)
money_5 = FundingRound.new(pied_piper, sequoia, "Pre-Seed", 1)
money_6 = FundingRound.new(tesla, accel, "Series-B", 5)
binding.pry
0 #leave this here to ensure binding.pry isn't the last lines