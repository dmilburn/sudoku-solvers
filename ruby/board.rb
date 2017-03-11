class Board
  def initialize(board_string)
    @board = format_board(board_string)
  end

  def format_board(board_string)
    board = board_string.split("")
    board.map do |cell|
        value = cell != "-" ? cell : nil
        Cell.new({value: value})
    end.each_slice(9).to_a
  end

  def row(index)
    @board[index]
  end

  def column(index)
    @board.transpose[index]
  end

end
