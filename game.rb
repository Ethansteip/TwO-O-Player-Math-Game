class Game
  # Initialize user_turn, winner, loser and game input
  def initialize
    @user_turn = 1
    @winner = nil
    @loser = nil
    @player_input = ""
  end
  # start_game contains the game loop
  def start_game
    
    #create two players 1 & 2
    player_1 = Player.new
    player_2 = Player.new

    # Welcome players to game
    puts "---Welcome to the Ruby Math Challenge!---"
    # Game loop
    while (@winner == nil) do
      question = Question.new
      num_1 = question.num_1
      num_2 = question.num_2
      answer = num_1 + num_2

      puts "Player #{@user_turn}: whats #{num_1} + #{num_2}?"
      player_input = gets.to_i

      # Check answer and display appropriate message, decrement player point if needed.
      self.check_answer(player_1, player_2, player_input, answer)
      # Print current scores to terminal
      puts "P1: #{player_1.points}/3 vs P2: #{player_2.points}/3"
      # switch turns
      self.switch_turn
      # Check if there is a winner
      if self.check_winner(player_1, player_2)
        break
      end
    end
  end

  # Checks the answer to a question
  def check_answer(p1, p2, input, answer)
    if input == answer
      puts "Player #{@user_turn}: Well done, you got the correct answer!"
    else
      puts "Player #{@user_turn}: Sorry, that was incorrect"
      # Decrement player's score
      @user_turn == 1 ? p1.lose_point : p2.lose_point
    end
  end

  #check to see if there is a winner after each round
  def check_winner(player_1, player_2)
    if player_1.points == 0
      puts "---GAME OVER---"
      puts "Player 2 wins with a score of #{player_2.points}/3!"
      return true
    elsif player_2.points == 0
      puts "---GAME OVER---"
      puts "Player 1 wins with a score of #{player_1.points}/3!"
      return true
    else
      return nil
    end
  end

  # Switch turns between players by toggling 1 / 2
  def switch_turn
    @user_turn == 1 ? @user_turn = 2 : @user_turn = 1
  end

end