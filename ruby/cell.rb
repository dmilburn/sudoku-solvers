class Cell

  attr_reader :value

  def initialize(args = {})
    @value = args[:value]
    @column = args[:column]
    @row = args[:row]
    @box = decide_box
  end

  def decide_box
    (@row/3 * 2) + @row/3 + @column/3
  end


end


# given the board string
# where should the row be stored?
# where should the column be stored?
# where should the box be stored?
# how should the board be stored?

# it'd be helpful to say cell.box
# it'd be really nice to say, hey board, what values can this column be?