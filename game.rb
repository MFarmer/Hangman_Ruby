require_relative 'computer_player'
require_relative 'human_player'

class Game
  def initialize(guesser,chooser)
    @guesser = guesser
    @chooser = chooser
    @turns_remaining = 15
  end

  def play
    # Step 1: Pick a word
    @chooser.pick_secret_word

    while @turns_remaining > 0
      # Step 2: Draw scoreboard
      update_ui

     @guesser.get_secret_word_status(@chooser.secret_word_status)

      # Step 3: Guess a letter
      @chooser.check_guess(@guesser.guess)

      break if word_guessed?

      @turns_remaining -= 1
    end

    @turns_remaining = -1 if word_guessed?
    update_ui

    puts
    if @turns_remaining < 1 && @turns_remaining != -1
      puts "Sorry, the correct answer was '#{@chooser.secret_word}'"
    else
      puts " Congrats, you guessed the word correctly."
    end
  end

  def update_ui
    puts
    @chooser.word_status.each do |el|
      if el[:guessed]
        print " #{el[:letter]}"
      else
        print " _ "
      end
    end
    puts
    puts "Guessed: #{@guesser.guessed_letter.join(' ')}"
    puts "[!] #{@turns_remaining} turns remaining" if @turns_remaining != -1
  end

  def word_guessed?
    @chooser.word_status.each do |el|
      return false if !el[:guessed]
    end
    return true
  end

end