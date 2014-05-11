require 'debugger'

class ComputerPlayer

  attr_reader :guessed_letter
  attr_reader :secret_word
  attr_reader :word_status

  def initialize(dictionary_file_name)
    @guessed_letter = []
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

  def secret_word_status
    @word_status.map { |el| el[:guessed] ? el[:letter] : nil }
  end

  def get_secret_word_status(status_list)
    @word_status = status_list
  end

  def guess
=begin
    letters = ('a'..'z').map { |x| x }
    input = letters.shuffle.first

    if @guessed_letter.include?(input)
      letters = ('a'..'z').map { |x| x }
      input = letters.shuffle.first
    end
    puts "Putting #{input} into #{@guessed_letter}"
    @guessed_letter << input

    return @guessed_letter.last
=end
    #debugger
    possible_words = []
    @word_bank.each do |word|
      word_letter_list = word.split('')

      match = true
      # Test 1: Get possible words
      if word_letter_list.count == @word_status.count
        @word_status.each_with_index do |el, index|
          match = true
          if !el.nil? && word_letter_list[index] != el
            match = false
            break
          end
        end
        possible_words << word if match
      end
    end

    # Test 2: Get best letters
    best_letters = Hash.new(0)
    possible_words.each do |word|
      word.split('').each do |letter|
        best_letters[letter] += 1
      end
    end
    #debugger
    letter_list = best_letters.sort_by { |letter,count| count }.reverse

    letter_list.each do |el|
      next if @guessed_letter.include?(el[0])
      @guessed_letter << el[0]
      return el[0]
    end
  end

  def check_guess(guessed_letter)
    @word_status.each do |el|
      if el[:letter] == guessed_letter && !el[:guessed]
        el[:guessed] = true
      end
    end
  end

end