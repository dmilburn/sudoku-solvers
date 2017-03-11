require_relative 'board'
require_relative 'cell'
require 'pry'
require 'set'


board_strings = File.readlines('../boards.txt')

board = Board.new(board_strings[0].chomp)
board.solve

puts board
