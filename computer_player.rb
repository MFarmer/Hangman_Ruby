class ComputerPlayer

  attr_reader :guessed_letter
  attr_reader :secret_word
  attr_reader :word_status

  def initialize(dictionary_file_name)
    @word_bank = []
    File.open(dictionary_file_name, "r") do |f|
      f.each_line do |line|
        @word_bank << line.chomp
      end
    end
  end

  def pick_secret_word
    @word_status = []
    @secret_word = @word_bank.sample
    @secret_word.split('').each { |letter| @word_status << { :letter => letter, :guessed => false} }
  end

  def receive_secret_length

  end

  def guess

  end

  def check_guess(guessed_letter)
    @word_status.each do |el|
      if el[:letter] == guessed_letter && !el[:guessed]
        el[:guessed] = true
      end
    end
  end

  def handle_guess_response

  end
end