class HumanPlayer 

    def initialize
    end

    def prompt(legal_positions)
        invalid = true
        while invalid
            invalid = false
            puts "Please enter a position like 0,0"

            pos = gets.chomp.split(",") # potentially ["a","2","c"]
            if self.invalid?(pos)
                puts "invalid position"
                invalid = true
            end
        end 
        pos.map!{|ele| ele.to_i}
    end

    def invalid?(pos)
        pos == nil || pos.any?{ |ele| ele.to_i.to_s != ele} || pos.any?{|ele| ele.to_i > 4 } || pos.any?{|ele| ele.to_i < 0 } || !pos.length == 2
    end


end 