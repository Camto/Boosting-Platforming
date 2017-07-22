package Other {
	import flash.events.KeyboardEvent;
	
	public class Keys {
		
		public var up:Boolean = false;
		public var left:Boolean = false;
		public var down:Boolean = false;
		public var right:Boolean = false;
		
		public var w:Boolean = false;
		public var a:Boolean = false;
		public var s:Boolean = false;
		public var d:Boolean = false;
		
		public function Keys():void {
			
			
			
		}
		
		public function key_down(event:KeyboardEvent):void {
			
			switch(event.keyCode) {
				
				case 38:
					up = true;
					break;
				
				case 37:
					left = true;
					break;
				
				case 40:
					down = true;
					break;
				
				case 39:
					right = true;
					break;
				
				case 87:
					w = true;
					break;
				
				case 65:
					a = true;
					break;
				
				case 83:
					s = true;
					break;
				
				case 68:
					d = true;
					break;
				
			}
			
		}
		
		public function key_up(event:KeyboardEvent):void {
			
			switch(event.keyCode) {
				
				case 38:
					up = false;
					break;
				
				case 37:
					left = false;
					break;
				
				case 40:
					down = false;
					break;
				
				case 39:
					right = false;
					break;
				
				case 87:
					w = false;
					break;
				
				case 65:
					a = false;
					break;
				
				case 83:
					s = false;
					break;
				
				case 68:
					d = false;
					break;
				
			}
			
		}
		
	}
}