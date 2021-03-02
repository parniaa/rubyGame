
class Question
  attr_reader :current_question, :answer

  def initialize
    @current_question = nil
    @answer = nil
  end

  def create_question
    number1 = rand(10)
    number2 = rand(10)
    set_answer(number1, number2)
    @current_question = "What is the sum of #{number1} plus #{number2}"
  end

  def check_answer?(answer)
    @answer == answer 
  end

  private
  
  def set_answer(number1, number2)
    @answer = number1 + number2
  end
end