require_relative 'GameBoard'
require_relative 'Serialization'
require 'json'

def new_game
  dictionary = File.readlines('5desk.txt', chomp: true).select {|word| (5..12).cover? word.length}
  the_word = dictionary[Random.rand(dictionary.length - 1)]
end

#this block runs for a new game
current_game = GameBoard.new(new_game())
current_game.cells.times do |cell|
  current_game.container[cell] = LetterCell.new(current_game.word[cell])
end
misses_left = 6
#end new game block

def saving_game(current_game)
  puts "Save file as: "
  saved_file_name = gets.chomp
  Serialization.save_state(current_game, saved_file_name)
end

until misses_left == 0 do
  puts "Misses remaining: #{misses_left}"
  current_game.display_board
  puts "Deadwall: #{current_game.deadwall}"
  puts "Choose a letter: "
  this_turn = gets.chomp.downcase
  if this_turn == "save"
    saving_game(current_game)
  else
    turn_check = LetterCell.finds
    current_game.container.each {|e| e.evaluate_cell(this_turn)}
    if turn_check == LetterCell.finds
      current_game.deadwall.push(this_turn.chomp)
      misses_left -= 1
    end
    break if current_game.container.all? {|e| e.revealed}
  end
end
if current_game.container.all? {|e| e.revealed}
  current_game.display_board
  puts "Winner Winner Chicken Dinner!"
else
  puts "Sorry! The word was #{current_game.word}!"
  puts "Better luck next time!"
end
