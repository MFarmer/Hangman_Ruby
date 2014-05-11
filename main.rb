require_relative 'game'

computer = ComputerPlayer.new('dictionary.txt')
human = HumanPlayer.new
game = Game.new(human,computer)

game.play


