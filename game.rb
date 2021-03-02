require_relative 'host'
require_relative 'question'
require_relative 'player'

class Game
  def initialize
    @host = Host.new
    @player1 = Player.new("B")
    @player2 = Player.new("A")
    @current_player = nil
    @active_game = true
  end

  def start_game
    @host.speak("Welcome to Quiz!")
    @current_player = @player1

    while @active_game
      @host.speak("---New Turn---")
      new_question = Question.new
      puts "Question for #{@current_player.name}: #{new_question.create_question}"
      if new_question.check_answer?(@host.input.to_i)
        @host.speak("Correct!")
        @host.speak("#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3")
        switch_players
      else
        @host.speak("Incorrect")
        @current_player.reduce_lives
        @host.speak("#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3")
        dead?(@current_player)
        switch_players
      end
    end
  end

  private

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def dead?(player)
    player.lives <= 0 ? end_game : false
  end

  def winner_is
    @player1.lives > @player2.lives ? @player1.name : @player2.name
  end
  

  def end_game 
    winner = winner_is
    @active_game = false
    @host.speak(" #{winner} is the winner")
  end
end
