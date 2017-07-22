package {
	import flash.display.*;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	import Game_Objects.*;
	import Other.*;
	
	public class Main extends Sprite {
		
		public var player:Player = new Player();
		public var blocks:Vector.<Block> = new Vector.<Block>;
		
		public var keys:Keys = new Keys();
		
		public function Main():void {
			
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
			
		}
		
		private function init(event:Event = null):void {
			
			var count:Number = 0;
			var x:Number = 0;
			var y:Number = 0;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			
			stage.addEventListener(Event.ENTER_FRAME, game);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keys.key_down);
			stage.addEventListener(KeyboardEvent.KEY_UP, keys.key_up);
			
			addChild(player);
			
			for(y = 0; y < level.length; y++) {
				for(x = 0; x < level[y].length; x++) {
					if(level[y][x]) {
						
						blocks.push(new Block(x * 20, y * 20));
						
					}
				}
			}
			
			for(count = 0; count < blocks.length; count++) {
				addChild(blocks[count]);
			}
			
		}
		
		private function game(event:Event):void {
			
			player.update(blocks, keys);
			
		}
		
	}
	
}