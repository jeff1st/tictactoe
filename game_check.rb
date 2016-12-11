module Gamerules
  def checkGrid(board)
    return "win" if isWinner?(board)
    return "draw" if isDraw?(board)
    return " "
  end

  def isDraw?(board)
    (0...3).each do |i|
      return false if board[i].any? { |elt| elt == " " }
    end

    return true if !isWinner?(board)
  end

  def isWinner?(board)
    if board[0][0] != " "
      return true if (board[0][0] == board[0][1]) && (board[0][1] == board[0][2])
      return true if (board[0][0] == board[1][1]) && (board[1][1] == board[2][2])
    end

    if board[1][0] != " "
      return true if (board[1][0] == board[1][1]) && (board[1][1] == board[1][2])
    end
    
    if board[2][0] != " "
      return true if (board[2][0] == board[2][1]) && (board[2][1] == board[2][2])
      return true if (board[2][0] == board[1][1]) && (board[1][1] == board[0][2])
    end

    if board[0][0] != " "
      return true if (board[0][0] == board[1][0]) && (board[1][0] == board[2][0])
    end

    if board[0][1] != " "
      return true if (board[0][1] == board[1][1]) && (board[1][1] == board[2][1])
    end

    if board[0][2] != " "
      return true if (board[0][2] == board[1][2]) && (board[1][2] == board[2][2])
    end

    return false
  end
end
