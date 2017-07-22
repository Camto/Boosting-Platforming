package Game_Objects {
	import Game_Objects.Square;
	import Game_Objects.Block;
	import Other.Keys;
	
	public class Player extends Square {
		
		private var xv:Number = 0;
		private var yv:Number = 0;
		
		// The player's multiple states!
		private	var surface:String = "ground"; // The surface the player is currently on. Can be "ground", "air", "left wall", or "right wall".
		private var boosts:Number = 2; // How many boosts the player has left. Is a number between "0" and "2".
		private var boosting:Number = 0; // If the player is dashing or pounding. Set to "0" if the player is not dashing, is set to greater than "0" is the player is and acts like a timer. Set to "-1" if pounding.
		
		public function Player():void {
			super(191, 191, 18, 18); // Create the player!
		}
		
		public function update(blocks:Vector.<Block>, keys:Keys):void {
			
			var count:Number = 0;
			var collided:Boolean = false;
			
			if(!boosting) { // (not dashing)
				if(boosting != -1) { // (not pounding)
					if(surface != "left wall" && surface != "right wall") { // (not on a wall)
						if(surface == "ground") { // (standing or walking)
							
							if(keys.hold_left || keys.hold_a) {
								xv -= 2;
							}
							if(keys.hold_right || keys.hold_d) {
								xv += 2;
							}
							
							xv *= 0.8;
							
							if(keys.hold_up || keys.hold_w && boosts) {
								
								yv = -15;
								boosts--;
								surface = "air";
								
							}
							
						} else { // (IN THE AIR!!!)
							
							if(keys.hold_left || keys.hold_a) {
								xv -= 2;
							}
							if(keys.hold_right || keys.hold_d) {
								xv += 2;
							}
							
							xv *= 0.8;
							yv += 0.9;
							
						}
					} else { // (ON A WALL!!!)
						
						
						
					}
				} /* else { // (POUNDING!!!)
					
					lol(nope);
					
				} */
			} else { // (DASHING!!!)
				
				
				
			}
			
			x += xv;
			y += yv;
			
			/*
			collided = false;
			
			for(count = 0; count < blocks.length; count++) {
				if(collide(blocks[count])) {
					collided = true;
				}
			}
			
			if(collided) {
				
				// collision
				
			}
			*/
			
		}
		
	}
}