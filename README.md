
The game consists of 10 frames as shown above.  In each frame the player has
two opportunities to knock down 10 pins.  The score for the frame is the total
number of pins knocked down, plus bonuses for strikes and spares.

A spare is when the player knocks down all 10 pins in two tries.  The bonus for
that frame is the number of pins knocked down by the next roll.  So in frame 3
above, the score is 10 (the total number knocked down) plus a bonus of 5 (the
number of pins knocked down on the next roll.)

A strike is when the player knocks down all 10 pins on his first try.  The bonus
for that frame is the value of the next two balls rolled.

In the tenth frame a player who rolls a spare or strike is allowed to roll the extra
balls to complete the frame.  However no more than three balls can be rolled in
tenth frame.

Write a class named “Game” that has two methods
roll(pins : int) is called each time the player rolls a ball.  The argument is the number of pins knocked down.
score() : int is called only at the very end of the game.  It returns the total score for that game.

---

Bowling Game green belt: intermediate

Count and sum the scores of a bowling game of one player.

A bowling game consists of 10 frames in which the player tries to knock down
the 10 pins. In every frame the player can throw one or two times. The actual
number depends on strikes and spares. The score of a frame is the number of
knocked down pins plus bonuses for strikes and spares. After every frame the 10
pins are resettet.

Strikes

The player has a strike of he knocks down all 10 pins with the first roll in a
frame. The frame ends immediately (since there are no pins left for a second
roll). The bonus for that frame is the number of pins knocked down by the next
two rolls. That is the next frame, except if the player rolls a strike again.

Spares

The player has a spare if the knocks down all 10 pins with the two roles of a
frame. The bonus for that frame is the number of pins knocked down by the next
roll (first role of next frame).

10th frame

If the player rolls a strike or spare in the 10th frame he can roll the
additional balls for the bonus. But he can never roll more than 3 balls in the
10th frame. The additional rolls only count for the bonus not for the regular
frame count.

10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first
strike and 20 points for the bonus) 1, 9, 10 in the 10th frame gives 20 points
(10 points for the regular spare and 10 points for the bonus) Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2
strikes for the bonus in the 10th frame). The Perfect Game scores to 300
points.

Example score

Frame Roll  Knocked-down-pins Total-score Notes
1     1     1
1     2     4                 5
2     1     4
2     2     5                 14
3     1     6
3     2     4                 29          Spare: 10 pins plus bonus of 5 from next roll (roll 1 of frame 4)
4     1     5
4     2     5                 49          Spare: 10 pins plus bonus of 10 from next roll (roll 1 frame 5)
5     1     10                            Strike
5     2     x                 60          Strike: 10 pins plus bonus of 1 from next frame (rolls 1 and 2 from frame 6)
6     1     0                             Bad luck
6     2     1                 61
7     1     7
7     2     3                 77          Spare
8     1     6
8     2     4                 97          Spare
9     1     10                            Strike
9     2                       117
10    1     2
10    2     8                             Spare
10    3     6                 133         Extra roll due to spare in 10th frame

Write a class BowlingGame with two methods
+ roll(pins : int)
+ score() : int

For every roll the roll method is called. The score method returns the total score.

Test cases

see table with example game

References

The kata was described originally by Robert Martin (see original description).
Wikipedia article with the scoring rules: http://en.wikipedia.org/wiki/Ten-pin_bowling#Scoring

---

http://elegantcode.com/2014/01/02/clojure-kata-2-the-bowling-game/
