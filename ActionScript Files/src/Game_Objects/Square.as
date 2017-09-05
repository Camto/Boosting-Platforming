package Game_Objects {
	import flash.display.Sprite;
	
	public class Square extends Sprite {
		
		public var w:Number;
		public var h:Number;
		
		public function Square(x:Number = 190, y:Number = 190, w:Number = 20, h:Number = 20):void {
			
			this.x = x;
			this.y = y;
			this.w = w;
			this.h = h;
			
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, this.w, this.h);
			graphics.endFill();
			
		}
		
		public function collide(other:Square):Boolean {
			
			return x < other.x + other.w && x + w > other.x && y < other.y + other.h && y + h > other.y;
			
		}
		
	}
}