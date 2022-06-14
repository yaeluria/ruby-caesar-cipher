class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Board
  attr_accessor :tiles

  def initialize(player1, player2, tiles = default_tiles)
    @tiles = tiles
    @player1 = player1
    @player2 = player2
  end

  def move_possible?
    @tiles.value?(nil)
  end

  def winner
    return if winning_symbol.empty?

    if @player1.symbol == winning_symbol[0]
      @player1.name
    else
      @player2.name
    end
  end

  private

  def default_tiles
    tile_keys = %w[a1 b1 c1 a2 b2 c2 a3 b3 c3]
    Hash[tile_keys.map { |key| [key, nil] }]
  end

  def winning_symbol
    %w[x o].select do |symbol|
      tiles_by_symbol = @tiles.select { |_position, val| val == symbol }.keys
      next if tiles_by_symbol.length < 3

      win?(tiles_by_symbol)
    end
  end

  def win_axial?(win_chars, chars_to_check)
    win_chars.map { |char| chars_to_check.count(char) == 3 }.any?
  end

  def win_diagonal?(win_row, tiles_by_symbol)
    (win_row - tiles_by_symbol).empty?
  end

  def win?(tiles_by_symbol)
    letters_by_symbol = tiles_by_symbol.map { |tile| tile[0] }
    numbers_by_symbol = tiles_by_symbol.map { |tile| tile[1].to_i }
    letters_by_symbol.uniq.count == 1 ||
      win_axial?([1, 2, 3], numbers_by_symbol) ||
      win_axial?(%w[a b c], letters_by_symbol) ||
      win_diagonal?(%w[a3 b2 c1], tiles_by_symbol) ||
      win_diagonal?(%w[a1 b2 c3], tiles_by_symbol)
  end
end

class TicTacToeGame
  def initialize
    p "what's your name, player 1?"
    @player1 = Player.new(gets.chomp, 'x')
    p "what's your name, player 2?"
    @player2 = Player.new(gets.chomp, 'o')
    # tiles = {"a1"=>"x", "b1"=>"o", "c1"=>"o", "a2"=>"o", "b2"=>"x", "c2"=>"x", "a3"=>"x", "b3"=>nil, "c3"=>nil}

    @current_player ||= @player1
    @board = Board.new(@player1, @player2)
    # @board = Board.new(@player1, @player2, tiles)
  end

  def play_game
    while !@board.winner && @board.move_possible?
      p @board.tiles
      if move
        @current_player = @current_player == @player1 ? @player2 : @player1
      end
    end
    unless @board.winner
      p "it's a tie"
      return
    end
    p "#{@board.winner} is the winner"
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
