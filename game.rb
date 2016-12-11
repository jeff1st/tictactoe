require './board'
require './players'
require './game_check'

class Game
  include Gamerules

  def initialize
    @player_one = ""
    @player_two = ""
    @count = 0
    talkToPlayer("start")
  end

  private

  def mainLoop
    @board = Board.new
    endgame = "none"

    while endgame == "none"
      @count += 1
      player = whichPlayer(@count)
      puts "\n"
      puts "#{player.name}, it's your turn".center(50)
      puts "Your choice?".center(50)
      puts "\n"
      @board.updateChoices
      @board.inGame
      tickBox(player)
      result = checkGrid(@board.core)

      endgame = "true" if result != " "
    end

    endLoop(result, player)
  end

  def tickBox(player)
    validate = false

    while validate == false
      choice = gets.chomp
      if choice =~ /^[1-9]$/
        (0...3).each { |i| validate = true if @board.choices[i].include?(choice.to_i) }
        puts "Already chosen!" if !validate
      else
        puts "Wrong choice! You need to choose a number between 1 and 9"
      end
    end

    case choice
    when "1"
      @board.core[0][0] = player.mark
    when "2"
      @board.core[0][1] = player.mark
    when "3"
      @board.core[0][2] = player.mark
    when "4"
      @board.core[1][0] = player.mark
    when "5"
      @board.core[1][1] = player.mark
    when "6"
      @board.core[1][2] = player.mark
    when "7"
      @board.core[2][0] = player.mark
    when "8"
      @board.core[2][1] = player.mark
    when "9"
      @board.core[2][2] = player.mark
    else
      puts "not a real choice!"
    end
  end

  def whichPlayer(number)
    number%2 != 0 ? (player = @player_one) : (player = @player_two)
    return player
  end
  
  def endLoop(result, player)
    if result == "win"
      puts "#{player.name} has won!".center(50)
      player.score += 1
      talkToPlayer("win")
    else
      talkToPlayer("draw")
    end
  end

  def talkToPlayer(state)
    if state == "start"
      validate = false
      puts "Welcome to my Game!".center(100)
      puts "\n"
      while !validate
        puts "\n"
        puts "please, player one, enter your name: ".center(50)
        po = gets.chomp
        puts "\n"
        puts "please, player two, enter your name: ".center(50)
        pt = gets.chomp
        puts "\n"

        puts "player one: #{po}".center(50)
        puts "player two: #{pt}".center(50)
        puts "\n"
        puts "Is that correct? (y/n)"
        puts "\n"
        answer = gets.chomp
        answer == "y" ? (validate = true) : (puts "OK then, try again")
      end
      @player_one = Players.new(po, "X")
      @player_two = Players.new(pt, "O")
      puts "\n"
      puts "Welcome players: #{@player_one.name} and #{@player_two.name}!".center(100)
      puts "\n"
      mainLoop

    elsif state == "win"
      validate = false
      puts "\n"
      puts "End of round".center(100)
      puts "\n"
      puts "Scores are: ".center(100)
      puts "#{@player_one.name}: #{@player_one.score} vs #{@player_two.name}: #{@player_two.score}".center(100)
      while validate == false
        puts "\n"
        puts "Play again? (y/n)".center(100)
        answer = gets.chomp
        (validate = true; mainLoop) if answer == "y"
        (validate = true; exit(0)) if answer == "n"
      end

    else
      validate = false
      puts "\n"
      puts "This is a draw!".center(100)
      puts "\n"
      puts "End of round".center(100)
      puts "\n"
      puts "Scores are: ".center(100)
      puts "#{@player_one.name}: #{@player_one.score} vs #{@player_two.name}: #{@player_two.score}".center(100)
      while validate == false
        puts "\n"
        puts "Play again? (y/n)".center(100)
        answer = gets.chomp
        (validate = true; mainLoop) if answer == "y"
        (validate = true; exit(0)) if answer == "n"
      end
    end
  end
end
