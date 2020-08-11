require "byebug"
class Hangman
  
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses 

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample()
  end
 
  def initialize
    # debugger
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length,'_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |ch, idx|
      if ch == char
        indices << idx
      end
    end
    return indices
  end

  def fill_indices(char, indices)
    indices.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
      indices = self.get_matching_indices(char)
      self.fill_indices(char,indices)
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    self.try_guess(gets.chomp)
  end

  def win?
    # debugger
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
      if @remaining_incorrect_guesses == 0
        p "LOSE" 
        return true  
      else
        return false
      end
    
  end

  def game_over?
      if self.win? || self.lose? 
        p @secret_word 
        return true
      
      else
        return false
      end

  end




end











