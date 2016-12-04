require 'matrix'

class Game
  attr_reader :player_one, :player_two

  def initialize(mat)
    @mat = mat
    initiatePlayers
  end

  def repr
    @mat.to_a.each { |row| puts row.inspect }
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
    @player_one = Player.new(po)
    @player_two = Player.new(po)
  end
end

class Player
  attr_reader :name
  attr_accessor :score

  def initialize(name, score=0)
    @name = name
    @score = score
  end
end

plate = Game.new(Matrix[[0, 0, 0], [0, 0, 0], [0, 0, 0]])

