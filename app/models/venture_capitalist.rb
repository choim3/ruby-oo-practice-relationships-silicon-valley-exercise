require 'pry'
class VentureCapitalist
    
    attr_accessor :name, :total_worth
    
    @@all = []
    @@worth = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.tres_commas_club
        self.all.select { |x| x.total_worth >= 1000000000} #.map {|y| y.name}
    end
    
    def offer_contract (startup, investment_type, investment_amount)
        FundingRound.new(startup, self, investment_type, investment_amount)
    end

    def funding_rounds
        FundingRound.all.select { |x| x.venture_capitalist == self }
    end

    def portfolio
        array = []
        FundingRound.all.select do |x| 
           if x.venture_capitalist == self
            array << x.startup
           end
        end
        array.uniq
    end

    def biggest_investment
        largest_funding = nil
        max_inv = 0
        FundingRound.all.each do |x|
            i = 0
            while i < self.portfolio.length
                if x.startup == self.portfolio[i]
                    if x.investment > max_inv
                        max_inv = x.investment
                        largest_funding = x.itself
                        #binding.pry
                    end
                end
                i += 1
            end
        end
        largest_funding
    end

    def invested (domain)
        total_invested = 0

        Startup.all.select do |x| 
            if x.domain == domain 
                FundingRound.all.each do |y| 
                    if y.startup.name == x.name 
                        total_invested += y.investment
                        #binding.pry
                    end
                end
            end
        end
        total_invested    
    end



end
