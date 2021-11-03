module TicTacToe

  class Game
    LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,9]]
    attr_accessor :board, :players, :current_player_id
    def initialize(player1_marker='X',player2_marker='O')

      @current_player_id = 0
      @board = Board.new()
      @players = [Player.new(player1_marker),Player.new(player2_marker)]
      play()

    end

    def play()
      puts "welcome to David's Tic Tac Toe!\nThis is a two player game\nPlayer #{current_player.marker} moves first, good luck!\n"
      @board.print_board
      loop do
        return puts "It's a draw!" unless @board.any_free_cells?
        play_round
        @board.print_board
        break if has_won?(current_player)
        shift_current_player
      end
      puts "player #{current_player.marker} wins!"
    end

    def play_round()
      loop do
        puts "Player #{current_player.marker}'s turn, please enter a cell to mark:"
        pos = gets.to_i
      
        begin @board.is_cell_free?(pos)
          rescue
            puts "Please input a valid cell value"
          else
            if @board.is_cell_free?(pos)
              pos = pos.to_i
              @board.mark(pos,          current_player.marker)
              current_player.mark(pos)
              break
            end
          end
        
      end
    end

  

    def has_won?(player)
      win = false
      for i in LINES

        for j in 0..2

          win = player.cells.include?(i[j])
          break if !win
        end
        break if win
      end

      win

    end

    def shift_current_player
      @current_player_id = 1 - @current_player_id
    end

    def current_player
      players[@current_player_id]
    end

    def other_player
      players[1 - @current_player_id]
    end
    

  end
  class Board
    attr_accessor :cells

    def initialize

      @cells = Array.new(10)
      for i in 1..9
        @cells[i] = Cell.new()
      end

    end
    
    def is_value_at?(pos, cmp)
      @cells[pos].is_value?(cmp)
    end

    def any_free_cells?
      for i in 1..9
        return true if is_cell_free?(i)
      end
      return false
    end

    def is_cell_free?(pos)
      is_value_at?(pos, nil)
    end

    def mark(pos, marker)
      @cells[pos].value = marker if is_cell_free?(pos)
    end

    def cell_at(pos)
      @cells[pos].value
    end

    def print_board()
      line = "\t--+---+--"
      puts "\n\t#{cell_at(1)} | #{cell_at(2)} | #{cell_at(3)}"
      puts line
      puts "\t#{cell_at(4)} | #{cell_at(5)} | #{cell_at(6)}"
      puts line
      puts "\t#{cell_at(7)} | #{cell_at(8)} | #{cell_at(9)}\n"
      puts ""
    end

  end

  class Cell  
    attr_accessor :value, :instance_id
    @@instance_count = 0
    
    def initialize()
      @@instance_count +=1
      @instance_id = @@instance_count
      
    end

    def value
      @value == nil ? @instance_id : @value
    end

    def is_value?(cmp)
      cmp == @value
    end

  end

  class Player
    
    attr_accessor :cells
    attr_reader :marker

    def initialize(marker)
      @marker = marker
      @cells = []
    end

    def mark(cell)
      @cells.push(cell)
    end

  end

end

include TicTacToe

play = Game.new()

