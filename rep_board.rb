class Board
  def initialize(rows=3, columns=3)
    @rows = rows
    @columns = columns
    @list = []
  end

  def construct
    (0...@rows).each do |i|
      temp_list = []
      (0...@columns).each do |j|
        temp_list.push(".")
      end
      @list.push(temp_list)
    end
  end

  def repr
    (0...@rows).each do |i|
      puts "#{@list[i]}"
    end
  end
end
