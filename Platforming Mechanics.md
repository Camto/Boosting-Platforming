# Platforming Mechanics
## Boosts:
A 'boost' is a sudden burst of speed in any given direction.

* **Jump boost** _(up)_: Upward speed that, with gravity, makes the player jump five times his height.
* **Pound boost** _(down)_: Makes your downward speed maximum.
* **Dash boost** _(left or right)_: Takes full control over the player. Gradually speeds up in the selected direction, no gravity. Lasts until **Dashing** is _0_.
## Player states:
* **Surface**: The surface the player is currently on. Can be _ground_, _air_, or _wall_.
* **Boosts**: How many boosts the player has left. Is a number between _0_ and _2_.
* **Boosting**: If the player is dashing or pounding. Set to _0_ if the player is not dashing, is set to greater than _0_ is the player is and acts like a timer. Set to _-1_ if pounding.
## _(psuedo)_ Code:
<pre>
If <b>Boosting</b> is <i>0</i> <i>(<b>not</b> dashing)</i>:
	If <b>Boosting</b> is <b>not</b> <i>-1</i> <i>(<b>not</b> pounding)</i>:
		If <b>Surface</b> is <b>not</b> <i>wall</i> <i>(<b>not</b> wall jumping)</i>:
			If <b>Surface/b> is <i>ground</i> <i>(standing)</i>:
				
			Else <i>(in the air)</i>:
				If holding left:
					Change speed to left.
				If holding right:
					Change speed to right.
				Apply friction.
				Move Horizontally.
				Apply gravity.
				Move vertically.
				If pressed left <b>and</b> <b>Boosts</b> is <b>more than</b> <i>0</i> <i>(dash boosting to the left)</i>:
					Set speed to left.
					Set <b>Boosting</b> to <i>1</i>.
					Decrease <b>Boosts</b> by <i>1</i>.
				If pressed right <b>and</b> <b>Boosts</b> is <b>more than</b> <i>0</i> <i>(dash boosting to the right)</i>:
					Set speed to right.
					Set <b>Boosting</b> to <i>15</i>.
					Decrease <b>Boosts</b> by <i>1</i>.
				If pressed up <b>and</b> <b>Boosts</b> is <b>more than</b> <i>0</i> <i>(jump boosting)</i>:
					Set speed to up.
					Decrease <b>Boosts</b> by <i>1</i>.
				If pressed down <b>and</b> <b>Boosts</b> is <b>more than</b> <i>0</i> <i>(pound boosting)</i>:
					Set speed to down.
					Set <b>Boosting</b> to <i>-1</i>.
					Decrease <b>Boosts</b> by <i>1</i>.
		Else <i>(wall jumping)</i>:
			
	Else <i>(pounding)</i>:
		Move vertically.
Else <i>(dashing)</i>:
	Decrease <b>Boosting</b> by <i>1</i>.
</pre>