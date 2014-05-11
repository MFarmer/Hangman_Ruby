class HumanPlayer

  attr_reader :guessed_letter
  attr_reader :secret_word
  attr_reader :word_status

  def initialize
    @guessed_letter = []
    @word_status = []
  end

  def pick_secret_word
    print "What is the length of your chosen word?: "
    input = gets.chomp.to_i
    input.times do
      @word_status << {:letter => '', :guessed => false}
    end
  end

  def secret_word_status
    @word_status.map { |el| el[:guessed] ? el[:letter] : nil }
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

  def check_guess(letter)

    puts "Computer guesses '#{letter}'"
    print "Does your word contain '#{letter}'?: "
    response = gets.chomp

    if response == 'y'
      print "What indices contain this letter?: "
      gets.chomp.split(' ').join.split('').map { |el| el.to_i }.each do |el|
        @word_status[el][:letter] = letter
        @word_status[el][:guessed] = true
      end
    end
  end

end