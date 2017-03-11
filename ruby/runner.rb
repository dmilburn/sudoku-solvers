require_relative 'board'
require_relative 'cell'

board_strings = File.readlines('../boards.txt')

board = Board.new(board_strings[0].chomp)

puts board
