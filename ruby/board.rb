class Board
  def initialize(board_string)
    @size = 9
    @board = format_board(board_string)
  end

  def solved?
    all_spaces_full?
  end

  def all_spaces_full?
    @board.all?{|row| row.all?{|cell| cell.value }}
  end

  def solve
    until solved?
      simple_solve
    end
  end

  def simple_solve
    @board.each_with_index do |line, row|
      line.each_with_index do |cell, column|
        if cell.value.nil?
          possibilities = find_possibilities(cell)
          if possibilities.length == 1
            cell.value = possibilities[0]
          end
        end
      end
    end
  end

  def find_possibilities(cell)
    ("1".."9").to_a - impossibilities_for_cell(cell)
  end

  def impossibilities_for_cell(cell)
    current_row = used_in_row(cell.row).to_set
    current_col = used_in_column(cell.column).compact.to_set
    current_box = used_in_box(cell.box).compact.to_set
    (current_row + current_col + current_box).to_a
  end

  def used_in_row(row)
    row(row).map{|cell| cell.value}.compact
  end

  def used_in_column(column)
    column(column).map{|cell| cell.value}.compact
  end

  def used_in_box(box)
    box(box).map{|cell| cell.value}.compact
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

  def box(index)
    @board.flatten.select do |cell|
      cell.box == index
    end
  end

  def to_s
    @board.map do |row|
      row.map do |cell|
        cell.value ? cell.value : "-"
      end.join(" ")
    end.join("\n")
  end

end
