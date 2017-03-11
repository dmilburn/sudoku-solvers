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
