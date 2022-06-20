require_relative 'board'
require_relative 'player'

class TicTacToeGame
  def initialize
    p "what's your name, player 1?"
    @player1 = Player.new(gets.chomp, 'x')
    p "what's your name, player 2?"
    @player2 = Player.new(gets.chomp, 'o')
    # tiles = {"a1"=>"x", "b1"=>"o", "c1"=>"o", "a2"=>"o", "b2"=>"x", "c2"=>"x", "a3"=>"x", "b3"=>nil, "c3"=>nil}

    @current_player ||= @player1
    @board = Board.new
  end

  def winner
    return if @board.winning_symbol.empty?

    if @player1.symbol == @board.winning_symbol[0]
      @player1.name
    else
      @player2.name
    end
  end

  def play_game
    while !winner && @board.move_possible?
      @board.tiles.values.each_slice(3).to_a.each { |row| puts row.to_s }
      if move
        @current_player = @current_player == @player1 ? @player2 : @player1
      end
    end
    p winner ? "#{winner} is the winner" : "it's a tie"
  end

  private

  # returns error if tile not valid
  def validate_tile(desired_tile)
    return 'this is not a valid tile' unless @board.tiles.key?(desired_tile)
    return 'this tile is already taken' unless @board.tiles[desired_tile].nil?
  end

  def move
    puts "Enter desired tile #{@current_player.name}"
    desired_tile = gets.chomp
    error = validate_tile(desired_tile)
    if error
      p error
      nil
    else
      @board.tiles[desired_tile] = @current_player.symbol
    end
  end
end

game = TicTacToeGame.new

game.play_game
