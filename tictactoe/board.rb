class Board
  attr_accessor :tiles

  SQUARE_BOARD_DIMENSIONS = 3

  def initialize(tiles = default_tiles)
    @tiles = tiles
  end

  def visualize
    tiles.values.each_slice(3).to_a.each { |row| puts row.to_s }
  end

  def move_possible?
    @tiles.value?(nil)
  end

  def winning_symbol
    %w[x o].select do |symbol|
      tiles_filled_by_symbol = @tiles.select { |_position, val| val == symbol }.keys
      next if tiles_filled_by_symbol.length < 3

      win?(tiles_filled_by_symbol)
    end
  end

  private

  def rows
    alphabet = ('a'..'z').to_a
    [*'a'..alphabet[(SQUARE_BOARD_DIMENSIONS - 1)]]
  end

  def columns
    [*1..SQUARE_BOARD_DIMENSIONS]
  end

  def default_tiles
    tile_keys = rows.product(columns).map(&:join)
    Hash[tile_keys.map { |key| [key, nil] }]
  end

  def diagonal_asc
    rows.zip(columns).map(&:join)
  end

  def diagonal_desc
    rows.reverse.zip(columns).map(&:join)
  end

  def win_axial?(win_chars, chars_to_check)
    win_chars.map { |char| chars_to_check.count(char) == 3 }.any?
  end

  def win_diagonal?(tiles_filled_by_symbol)
    (diagonal_asc - tiles_filled_by_symbol).empty? || (diagonal_desc - tiles_filled_by_symbol).empty?
  end

  def win?(tiles_filled_by_symbol)
    rows_filled_by_symbol = tiles_filled_by_symbol.map { |tile| tile[0] }
    columns_filled_by_symbol = tiles_filled_by_symbol.map { |tile| tile[1].to_i }

    rows_filled_by_symbol.uniq.count == 1 ||
      win_axial?(columns, columns_filled_by_symbol) ||
      win_axial?(rows, rows_filled_by_symbol) ||
      win_diagonal?(tiles_filled_by_symbol)
  end
end
