require 'pry'
class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []
    @@domain = []

    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domain << domain
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find {|start_up| start_up.founder == founder_name}
    end
    
    def self.domains
        @@domain
    end

    def sign_contract(venture_capitalist, investment_type, investment_amount)
        FundingRound.new(self, venture_capitalist, investment_type, investment_amount)
    end

    def num_funding_rounds
        FundingRound.all.select { |x| x.startup == self}.length
    end

    # def total_funds
    #     FundingRound.all.sum { |x| x.investment }
    # end

    def total_funds
        total_array = []
        FundingRound.all.select do |x|
            if x.startup == self
                total_array << x.investment
            end
        end
        total_array.sum
    end

    def investors
        array = []
        FundingRound.all.select do |x| 
            if x.startup == self 
                array << x.venture_capitalist.name
            end
        end
        array.uniq
       # self.all.select {|x| x.name == FundingRound.all.startup}
    end

    def big_investors
        # i = 0
        new_array = []
        VentureCapitalist.tres_commas_club.each do |x|
            i = 0
            while i < self.investors.length
                if x.name == self.investors[i]
                    new_array << x.name
                end
                i += 1
            end
        end
        new_array
    end



end
