class Question
  
  attr_accessor :num_1, :num_2

  #initializes num_1 and num_1 to a random number between 1 and 10.
  def initialize
    @num_1 = rand(1..100)
    @num_2 = rand(1..100)
    # operator = [+, -, /, *]
  end
end