package Other {
	import flash.events.KeyboardEvent;
	
	public class Keys {
		
		public var hold_up:Boolean = false;
		public var hold_left:Boolean = false;
		public var hold_down:Boolean = false;
		public var hold_right:Boolean = false;
		
		public var hold_w:Boolean = false;
		public var hold_a:Boolean = false;
		public var hold_s:Boolean = false;
		public var hold_d:Boolean = false;
		
		public var last_up:Boolean = false;
		public var last_left:Boolean = false;
		public var last_down:Boolean = false;
		public var last_right:Boolean = false;
		
		public var last_w:Boolean = false;
		public var last_a:Boolean = false;
		public var last_s:Boolean = false;
		public var last_d:Boolean = false;
		
		public var press_up:Boolean = false;
		public var press_left:Boolean = false;
		public var press_down:Boolean = false;
		public var press_right:Boolean = false;
		
		public var press_w:Boolean = false;
		public var press_a:Boolean = false;
		public var press_s:Boolean = false;
		public var press_d:Boolean = false;
		
		public function Keys():void {
			
		}
		
		public function key_down(event:KeyboardEvent):void {
			
			switch(event.keyCode) {
				
				case 38:
					hold_up = true;
					break;
				
				case 37:
					hold_left = true;
					break;
				
				case 40:
					hold_down = true;
					break;
				
				case 39:
					hold_right = true;
					break;
				
				case 87:
					hold_w = true;
					break;
				
				case 65:
					hold_a = true;
					break;
				
				case 83:
					hold_s = true;
					break;
				
				case 68:
					hold_d = true;
					break;
				
			}
			
		}
		
		public function key_up(event:KeyboardEvent):void {
			
			switch(event.keyCode) {
				
				case 38:
					hold_up = false;
					break;
				
				case 37:
					hold_left = false;
					break;
				
				case 40:
					hold_down = false;
					break;
				
				case 39:
					hold_right = false;
					break;
				
				case 87:
					hold_w = false;
					break;
				
				case 65:
					hold_a = false;
					break;
				
				case 83:
					hold_s = false;
					break;
				
				case 68:
					hold_d = false;
					break;
				
			}
			
		}
		
		public function update():void {
			
			if(!last_up && hold_up) {
				press_up = true;
			} else {
				press_up = false;
			}
			
			if(!last_left && hold_left) {
				press_left = true;
			} else {
				press_left = false;
			}
			
			if(!last_down && hold_down) {
				press_down = true;
			} else {
				press_down = false;
			}
			
			if(!last_right && hold_right) {
				press_right = true;
			} else {
				press_right = false;
			}
			
			if(!last_w && hold_w) {
				press_w = true;
			} else {
				press_w = false;
			}
			
			if(!last_a && hold_a) {
				press_a = true;
			} else {
				press_a = false;
			}
			
			if(!last_s && hold_s) {
				press_s = true;
			} else {
				press_s = false;
			}
			
			if(!last_d && hold_d) {
				press_d = true;
			} else {
				press_d = false;
			}
			
			last_up = hold_up;
			last_left = hold_left;
			last_down = hold_down;
			last_right = hold_down;
			
			last_w = hold_w;
			last_a = hold_a;
			last_s = hold_s;
			last_d = hold_d;
			
		}
		
	}
}