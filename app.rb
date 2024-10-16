require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

def rps(move)
  comp_move = moves = ["rock", "paper", "scissors"].sample
  if move == comp_move
    outcome = "tie"
  elsif move == "rock" && comp_move == "scissors" 
    outcome = "won"
  elsif move == "rock" && comp_move == "paper"
    outcome = "lost"
  elsif move == "paper" && comp_move == "rock"
    outcome = "win"
  elsif move == "paper" && comp_move == "scissors"
    outcome = "lost"
  elsif move == "scissors" && comp_move == "paper"
    outcome = "win"
  elsif move == "scissors" && comp_move == "rock"
    outcome = "lost"
  end
  return [comp_move, outcome]
end

get("/rock") do
  @user_move = "rock"
  game = rps(@user_move)
  @comp_move = game[0]
  @outcome = game[1]
  erb(:results)
end

get("/paper") do
  @user_move = "paper"
  game = rps(@user_move)
  @comp_move = game[0]
  @outcome = game[1]
  erb(:results)
end

get("/scissors") do
  @user_move = "scissors"
  game = rps(@user_move)
  @comp_move = game[0]
  @outcome = game[1]
  erb(:results)
end
