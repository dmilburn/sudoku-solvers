class Board
  def initialize(board_string)
    @size = 9
    @board = format_board(board_string)
    binding.pry
  end

  def format_board(board_string)
    board = board_string.split("")
    board.map.with_index do |cell, i|
        value = cell != "-" ? cell : nil
        row = i/@size
        column = i % @size
        Cell.new({value: value, column: column, row: row})
    end.each_slice(@size).to_a
  end

  def row(index)
    @board[index]
  end

  def column(index)
    @board.transpose[index]
  end

  def to_s
    @board.map do |row|
      row.map do |cell|
        cell.value ? cell.value : "-"
      end.join(" ")
    end.join("\n")
  end

end
