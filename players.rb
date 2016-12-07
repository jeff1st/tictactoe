class Players
  attr_reader :name, :mark
  attr_accessor :score

  def initialize(name, mark = "")
    @name = name
    @mark = mark
    @score = 0
  end
end
