require_relative "card.rb"

class Board 
    attr_reader :num

    def initialize
        @grid = Array.new(4){Array.new(4)}
        @cards = []
        self.populate
    end

    def populate
        alpha = ("A".."Z").to_a
        alpha[0...8].each do |chars|
            2.times {@cards << Card.new(chars)}
        end

        @cards = @cards.shuffle

        @grid.map! do |row|
            row.map! do |ele|
                ele = @cards.shift
            end 
        end 
    end

    def render
        puts "  0 1 2 3"
        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(" ")}"
        end
    end

    def won?
        @grid.flatten.all? { |ele| ele.face_up }
    end

    def [](pos)
        row, col = pos 
        @grid[row][col]
    end 

    # def []=(pos ,value)
    #     row, col = pos 
    #     @grid[row][col] = value
    # end 

    
    def reveal(pos) #========= [2,3]
        card = self[pos] 
        if !card.face_up
            card.reveal
        end
        self.render
        card.face_value
    end

    def legal_positions
        @legal_positions = []
        (0..3).each do |row|
            (0..3).each do |col|
                @legal_positions << [row,col] if !self[row,col].face_up
            end
        end
        @legal_positions
    end

end 
