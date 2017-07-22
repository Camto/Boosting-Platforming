package Game_Objects {
	import Game_Objects.Square;
	import Game_Objects.Block;
	import Other.Keys;
	
	public class Player extends Square {
		
		private var xv:Number = 0;
		private var yv:Number = 0;
		
		public function Player():void {
			
			super(191, 191, 18, 18);
			
		}
		
		public function update(blocks:Vector.<Block>, keys:Keys):void {
			
			var count:Number = 0;
			var collided:Boolean = false;
			
			if(keys.left) {
				xv -= 2;
			}
			
			if(keys.right) {
				xv += 2;
			}
			
			if(keys.up) {
				yv -= 2;
			}
			
			if(keys.down) {
				yv += 2;
			}
			
			xv *= 0.80;
			x += xv;
			
			collided = false;
			
			for(count = 0; count < blocks.length; count++) {
				if(collide(blocks[count])) {
					collided = true;
				}
			}
			
			if(collided) {
				
				x -= xv;
				xv = 0;
				
			}
			
			yv += 0.75;
			y += yv;
			
			collided = false;
			
			for(count = 0; count < blocks.length; count++) {
				if(collide(blocks[count])) {
					collided = true;
				}
			}
			
			if(collided) {
				
				y -= yv;
				yv = 0;
				
			}
			
		}
		
	}
}