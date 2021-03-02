class Player
  attr_accessor :lives
  attr_reader :name
 
  def initialize(name)
   @name = name
   @lives = 3
  end
 
  def alive?
   @lives > 0
  end
 
  def reduce_lives
   @lives -= 1
  end
 end