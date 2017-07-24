package Game_Objects {
	import Game_Objects.Square;
	import Game_Objects.Block;
	import Other.Keys;
	
	public class Player extends Square {
		
		private var xv:Number = 0;
		private var yv:Number = 0;
		
		// The player's multiple states!
		private	var surface:String = "air"; // The surface the player is currently on. Can be "ground", "air", "left wall", or "right wall".
		private var boosts:Number = 2; // How many boosts the player has left. Is a number between "0" and "2".
		private var boosting:Number = 0; // If the player is dashing or pounding. Set to "0" if the player is not dashing, is set to greater than "0" is the player is and acts like a timer. Set to "-1" if pounding.
		
		public function Player():void {
			super(191, 191, 18, 18); // Create the player!
		}
		
		public function update(blocks:Vector.<Block>, keys:Keys):void {
			
			var count:Number = 0;
			var collided:Boolean = false;
			var colliders:Array = new Array();
			
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
							yv += 0.9;
							
							if((keys.press_up || keys.press_w) && boosts) {
								
								yv = -15;
								boosts--;
								
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
							
							if(yv > 35) {
								
								yv = 35;
								
							}
							
							if((keys.press_left || keys.press_a) && boosts) {
								
								xv = -1.5;
								yv = 0;
								boosting = 15;
								boosts--;
								
							}
							
							if((keys.press_right || keys.press_d) && boosts) {
								
								xv = 1.5;
								yv = 0;
								boosting = 15;
								boosts--;
								
							}
							
							if((keys.press_up || keys.press_w) && boosts) {
								
								yv = -15;
								boosts--;
								
							}
							
							if((keys.press_down || keys.press_s) && boosts) {
								
								yv = 35;
								boosting = -1;
								boosts--;
								
							}
							
						}
					} else { // (ON A WALL!!!)
						
						if(surface == "left wall") { // (on a left wall)
							
							if(keys.press_right || keys.press_d) {
								xv = 2;
							}
							
							if((keys.press_up || keys.press_w) && (keys.hold_left || keys.hold_a)) { // Wall jump!
								
								xv = 5;
								yv = -10;
								
							}
							
						} else { // (on a right wall)
							
							if(keys.press_left || keys.press_a) {
								xv = -2;
							}
							
							if((keys.press_up || keys.press_w) && (keys.hold_right || keys.hold_d)) { // Wall jump!
								
								xv = -5;
								yv = -10;
								
							}
							
						}
						
					}
				} /* else { // (POUNDING!!!)
					
					lol(nope);
					
				} */
			} else { // (DASHING!!!)
				
				if (boosting > 7) {
					xv *= 1.5;
				} else {
					xv *= 0.33;
				}
				
				boosting--;
				
			}
			
			surface = "air";
			
			x += xv;
			
			collided = false;
			colliders = new Array();
			
			for(count = 0; count < blocks.length; count++) { // Loop through all the blocks.
				if(collide(blocks[count])) { // Check if they collide.
					collided = true; // BAM!
					colliders.push(blocks[count].x); // Register the block that are hit.
				}
			}
			
			if(collided) { // If you hit something.
				
				boosting = 0;
				
				if (xv > 0) { // Check for surface.
					x = Math.min.apply(null, colliders) - 18;
					surface = "right wall";
				} else {
					x = Math.max.apply(null, colliders) + 20;
					surface = "left wall";
				}
				
				boosts = 0; // No boosting on walls.
				
				xv = 0;
				
			}
			
			y += yv; // Now check for the y.
			
			collided = false;
			colliders = new Array();
			
			for(count = 0; count < blocks.length; count++) {
				if(collide(blocks[count])) {
					collided = true;
					colliders.push(blocks[count].y);
				}
			}
			
			if(collided) {
				
				boosting = 0;
				
				if(yv > 0) {
					y = Math.min.apply(null, colliders) - 18;
					surface = "ground";
					boosts = 2; // Refill boosts!
				} else {
					y = Math.max.apply(null, colliders) + 20;
				}
				
				yv = 0;
				
			}
			
		}
		
	}
}