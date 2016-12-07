require 'matrix'

class Game
  attr_reader :player_one, :player_two
  attr_accessor :mat

  def initialize(mat)
    @mat = mat
    initiatePlayers
#    mainGame
  end

  def repr
    (0...3).each do |i|
      puts "|#{@mat[i, 0]} #{@mat[i, 1]} #{@mat[i, 2]}|"
    end
  end

  def initiatePlayers
    validate = false
    while validate == false
      puts "Please, player one, give your name?"
      po = gets.chomp
      puts "Please, player two, give your name?"
      pt = gets.chomp
      puts "Player one: #{po}"
      puts "Player two: #{pt}"
      puts "Is that correct? y/n"
      answer = gets.chomp
      answer == "y" ? (validate = true) : ("OK, please start again")
    end
    @player_one = Player.new(po, score=0, input="X")
    @player_two = Player.new(pt, score=0, input="O")
  end

  def mainGame
    stop_game = false
    check = 2
    while stop_game == false
      player_turns(check)
      check_move ? (stop_game = true) : (puts "Next player please!")
      repr
      check += 1
    end
  end

  def player_turns(number)
    number%2 == 0 ? (player = 0) : (player = 1)
    player == 0 ? (p = @player_one.name) : (p = @player_two.name)
    puts "#{p}, it's your turn"
    puts "Which move?"
    move = gets.chomp
  end

  def check_move
    puts "checking ..."
    return false
  end

end

class Player
  attr_reader :name, :input
  attr_accessor :score

  def initialize(name, score, input="")
    @name = name
    @score = score
    @input = input
  end
end


