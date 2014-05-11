require_relative 'game'

computer = ComputerPlayer.new('dictionary.txt')
human = HumanPlayer.new
another_computer = ComputerPlayer.new('dictionary.txt')
game = Game.new(computer,another_computer)

game.play


