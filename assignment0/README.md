# Assignment 0 - Pong

CS50 - Games

This assignment modifies the pong program.  An artificial intelligence, or AI will control the motion of one of the paddles (I chose it to be the paddle on the left).  The AI rarely loses (it does, every so often - but I haven't figured out how to fix this).  Therefore, I adjusted the scoring so that a player's score is based on how long he is alive.  The player loses one life out of the 10 he starts with every time the AI scores.  The points received are 10 points for each 10 seconds, and then 20 points for each 10 seconds after 100 seconds, and so on.  When the AI fails to hit the ball back (which happens rarely), the player is awarded 50 points.  The game is over when the AI scores 10 times.
