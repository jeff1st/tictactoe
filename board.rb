class Board
  attr_reader :choices
  attr_accessor :core

  def initialize
    @rows = 3
    @columns = 3
    @core = []
    @choices = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    construct
    updateChoices
  end

  def updateChoices
    (0...@rows).each do |i|
      (0...@columns).each { |j| @choices[i][j] = " " if @core[i][j] != " " }
    end
  end

  def inGame
    puts "\t Game board \t\t Choices left".center(100)
    (0...@rows).each do |i|
      puts "|#{@core[i][0]} #{@core[i][1]} #{@core[i][2]}| \t\t |#{@choices[i][0]} #{@choices[i][1]} #{@choices[i][2]}|".center(100)
    end
    puts "\n"
  end
  
  private
  
  def construct
    (0...@rows).each do |i|
      temp_list = []
      (0...@columns).each { |j| temp_list << " " }
      @core << temp_list
    end
  end

  def repr
    (0...@rows).each { |i| puts "|#{@core[i][0]} #{@core[i][1]} #{@core[i][2]}|".center(100) }
    puts "\n"
  end

end
