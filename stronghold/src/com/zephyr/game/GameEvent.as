package com.zephyr.game
{
	import flash.events.Event;

	public class GameEvent extends Event
	{
		
		public static const STEP:String = "step";
		
		public var params:Object;
		
		public function GameEvent(type:String, params:Object)
		{
			super(type);
			this.params = params;
		}
		
	}
}