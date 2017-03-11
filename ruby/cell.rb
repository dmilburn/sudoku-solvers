class Cell

  attr_accessor :value
  attr_reader :box, :row, :column

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
