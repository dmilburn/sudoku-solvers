require_relative 'board'
require_relative 'cell'
require 'pry'

board_strings = File.readlines('../boards.txt')

board = Board.new(board_strings[0].chomp)
binding.pry
puts board
