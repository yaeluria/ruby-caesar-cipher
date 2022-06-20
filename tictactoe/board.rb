class Board
  attr_accessor :tiles

  def initialize(tiles = default_tiles)
    @tiles = tiles
  end

  def move_possible?
    @tiles.value?(nil)
  end

  def winning_symbol
    %w[x o].select do |symbol|
      tiles_by_symbol = @tiles.select { |_position, val| val == symbol }.keys
      next if tiles_by_symbol.length < 3

      win?(tiles_by_symbol)
    end
  end

  private

  def default_tiles
    tile_keys = %w[a1 b1 c1 a2 b2 c2 a3 b3 c3]
    Hash[tile_keys.map { |key| [key, nil] }]
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