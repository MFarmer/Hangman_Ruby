class HumanPlayer

  attr_reader :guessed_letter
  attr_reader :secret_word
  attr_reader :word_status

  def initialize
    @guessed_letter = []
  end

  def pick_secret_word
    print "What is the length of your chosen word?: "
    input = gets.chomp.to_i
    
  end

  def receive_secret_length

  end

  def guess
    print "What letter will you guess next?: "
    input = gets.chomp[0]

    if @guessed_letter.include?(input)
      print "You've guessed this letter already. Try again: "
      input = gets.chomp[0]
    end

    @guessed_letter << input

    return @guessed_letter.last
  end

  def check_guess

  end

  def handle_guess_response

  end
end