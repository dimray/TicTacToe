# squares = "1 2 3   _ _ _\n4 5 6   _ _ _\n7 8 9   _ _ _"
# available_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
# user = []
# computer = []

# def check_user_pick(available_numbers, user_selection, user, squares)
#   if available_numbers.include?(user_selection)
#     user_selection_index = squares.index(user_selection.to_s)
#     squares[user_selection_index + 8] = 'X'
#     puts 'Here is your pick:'
#     puts squares
#     user.push(user_selection)
#     available_numbers.delete(user_selection)
#   else
#     puts 'pick an available square'
#     user_selection = gets.chomp.to_i
#     check_user_pick(available_numbers, user_selection, user, squares)
#   end
# end

# def player_turn(available_numbers, user, squares)
#   puts 'Please pick a square from 1 to 9'
#   puts squares
#   user_selection = gets.chomp.to_i
#   check_user_pick(available_numbers, user_selection, user, squares)
# end

# def computer_turn(available_numbers, computer, squares)
#   comp_selection = available_numbers.sample
#   comp_selection_index = squares.index(comp_selection.to_s)
#   squares[comp_selection_index + 8] = '0'
#   puts 'Here is computer pick:'
#   puts squares
#   computer.push(comp_selection)
#   available_numbers.delete(comp_selection)
# end

# def check_for_win(picks, winning_combinations, available_numbers)
#   winning_combinations.each do |combo|
#     if combo - picks == []
#     puts "#{picks} wins"  
#     available_numbers.clear      
#     break
#     end
#   end
# end

# while available_numbers.length > 0
#   player_turn(available_numbers, user, squares)
#   sleep(1)
#   check_for_win(user, winning_combinations, available_numbers)

#   puts ''
#   if available_numbers.length > 0
#     computer_turn(available_numbers, computer, squares)
#     check_for_win(computer, winning_combinations, available_numbers)
#   end

# end

class TicTacToe

  # attr_accessor :squares, :available_numbers, :player_selections, :computer_selections
  # attr_reader :winning_combinations
  

  @@squares = "1 2 3   _ _ _\n4 5 6   _ _ _\n7 8 9   _ _ _"
  @@available_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  @@player_selections = []
  @@computer_selections = []


  def check_pick(user_selection)
    if @@available_numbers.include?(user_selection)
      user_selection_index = @@squares.index(user_selection.to_s)
      @@squares[user_selection_index + 8] = 'X'
      puts 'Here is your pick:'
      puts @@squares
      @@player_selections.push(user_selection)
      @@available_numbers.delete(user_selection)
    else
      puts 'pick an available square'
      user_selection = gets.chomp.to_i
      check_pick(user_selection)
    end
  end

  def player_turn
    puts 'Please pick a square from 1 to 9'
    puts @@squares
    user_selection = gets.chomp.to_i
    check_pick(user_selection)
  end

  def check_for_win(player, player_selections)
    @@winning_combinations.each do |combo|
      if combo - player_selections == []
        puts "#{player} wins"  
        @@available_numbers.clear      
        break
      end
    end
  end

  def computer_turn
    comp_selection = @@available_numbers.sample
    comp_selection_index = @@squares.index(comp_selection.to_s)
    @@squares[comp_selection_index + 8] = '0'
    puts 'Here is computer pick:'
    puts @@squares
    @@computer_selections.push(comp_selection)
    @@available_numbers.delete(comp_selection)
  end

  def initialize
      

    while @@available_numbers.length > 0
    player_turn
    sleep(1)
    check_for_win(player = "player", player_selections = @@player_selections)

    puts ''
    if @@available_numbers.length > 0
      computer_turn
      check_for_win(player = "computer", player_selections = @@computer_selections)
    end
  end
  end

end

game1 = TicTacToe.new
    


      
    