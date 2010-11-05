package com.zephyr.game.score {
	
	import flash.events.Event;
	
	public class ScoreEvent extends Event {
		
		public var params:Object;
		
		public function ScoreEvent(type:String, params:Object):void {
			super(type);
			this.params = params;
		}
		
		public override function clone():Event {
			return new ScoreEvent(this.type, this.params);
		}
		
		public override function toString():String {
			return formatToString("ScoreEvent","type","bubbles","cancelable","eventPhase","params");
		}

	}
}