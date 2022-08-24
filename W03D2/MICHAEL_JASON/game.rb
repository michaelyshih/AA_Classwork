require_relative "card.rb"
require_relative "board.rb"
require_relative "player.rb"

class Game
    
    def initialize()
        @board = Board.new
        @human_player = HumanPlayer.new()
        @computer_player = ComputerPlayer.new()
        @curr_player = @human_player
        @prev_guess = []
    end

    def play
        while !over?

            system("clear")
            @board.render
            pos = @curr_player.prompt(@board.legal_positions)
            @prev_guess << make_guess(pos)

            system("clear")
            @board.render
            pos = @curr_player.prompt(@board.legal_positions)

            if make_guess(pos) != @prev_guess[0]
                system("clear")
                @board.render
                puts "Try, again"
                sleep(2)
                make_guess(pos).hide
                @prev_guess[0].hide
            end

            switch_turn
            @prev_guess = []

        end
        system("clear")
        @board.render
        puts "Congradulations"
    end

    def switch_turn
        if @curr_player != @human_player
            @curr_player = @human_player
        else 
            @curr_player = @computer_player
        end 
    end

    def over?
        @board.won?
    end

    def make_guess(pos)
        @board[pos].reveal #== card instance 
        @board[pos]
    end


end