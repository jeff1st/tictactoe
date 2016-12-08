module Gamerules
  def checkGrid(board)
    return "win" if isWinner?(board)
    return "draw" if isDraw?(board)
    return " "
  end

  def isDraw?(board)
    (0...3).each do |i|
      if board[i].any? { |elt| elt == " " }
        return false
      end
    end
    if !isWinner?(board)
      return true
    end
  end

  def isWinner?(board)
    if board[0][0] != " "
      if (board[0][0] == board[0][1]) && (board[0][1] == board[0][2])
        return true
      end
      if (board[0][0] == board[1][1]) && (board[1][1] == board[2][2])
        return true
      end
    end

    if board[1][0] != " "
      if (board[1][0] == board[1][1]) && (board[1][1] == board[1][2])
        return true
      end
    end
    
    if board[2][0] != " "
      if (board[2][0] == board[2][1]) && (board[2][1] == board[2][2])
        return true
      end
      if (board[2][0] == board[1][1]) && (board[1][1] == board[0][2])
        return true
      end
    end

    if board[0][0] != " "
      if (board[0][0] == board[1][0]) && (board[1][0] == board[2][0])
        return true
      end
    end

    if board[0][1] != " "
      if (board[0][1] == board[1][1]) && (board[1][1] == board[2][1])
        return true
      end
    end

    if board[0][2] != " "
      if (board[0][2] == board[1][2]) && (board[1][2] == board[2][2])
        return true
      end
    end

    return false
  end
end
