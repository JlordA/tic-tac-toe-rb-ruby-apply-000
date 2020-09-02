WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, input_to_index, value = "X")
  board[input_to_index] = value
end

def position_taken?(board, index)
  board[index] == "O" || board[index] == "X"
end

def valid_move?(board, index)
  !(position_taken?(board, index)) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    puts "Please Enter a Valid Move"
    turn(board)
  end
end

def turn_count(board_array)
counter = 0
board_array.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  end
end
counter
end


def current_player(board_array)
  if turn_count(board_array) % 2 == 0
    "X"
  else
    "O"
  end
end
