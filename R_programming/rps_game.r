## ROCK PAPER SCISSORS GAME

rps_game <- function() {
actions <- c("rock", "scissors", "paper", "exit")
 
player_win <- 0
com_win <- 0
tie <- 0
 
while(TRUE) {
  player_move <- as.numeric(readline("Choose your move: rock[1], scissors[2], paper[3], exit[0]: "))
  if (player_move == 0) {
    message("Goodbye:D")
    message("Your scores: ", player_win)
    message("Computer's scores: ", com_win)
    break
  }
   
  player_move <- actions[player_move]
  computer_move <- actions[sample(1:3, 1)]
   
  if (player_move == computer_move) {
    message("TIE ")
    tie <- tie + 1
  } else if (player_move == "rock" & computer_move == "scissors") {
    message("you win ")
    player_win <- player_win + 1
  } else if (player_move == "scissors" & computer_move == "paper") {
    message("you win ")
    player_win <- player_win + 1
  } else if (player_move == "paper" & computer_move == "rock") {
    message("you win ")
    player_win <- player_win + 1
  } else {
    message("you lose ")
    com_win <- com_win + 1
  }
   
   
  message("Player Move:", player_move, "\n")
  message("Computer Move:", computer_move, "\n")
  message("WIN ", player_win)
  message("LOSS ", com_win)
  message("TIE ", tie)
   
}
}

rps_game()
