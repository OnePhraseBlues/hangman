class GameBoard
  attr_accessor :container, :word
  attr_reader :cells, :deadwall

  def initialize(word) 
    @cells = word.length 
    @container = []
    @word = word
    @deadwall = []
  end

  def display_board
    @container.each {|e| print e.display_cell + " "}
    puts
  end

end

class LetterCell
  attr_reader :revealed
  @@finds = 0
  def initialize(letter)
    @letter = letter
    @revealed = false
    @@finds += 1
  end

  def display_cell
    if @revealed
      @letter
    else
      "_"
    end
  end

  def evaluate_cell(user_guess)
    if user_guess == @letter
      @@finds -= 1
      @revealed = true
    end
  end

  def self.finds
    @@finds
  end

end