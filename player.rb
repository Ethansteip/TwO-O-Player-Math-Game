class Player
  # create accessor to get number of current points
  attr_accessor :points

  # initilize player with 3 points
  def initialize
    @points = 3
  end

  # method to decrement points based on payers answer to a question
  def lose_point
    @points -= 1
  end
end