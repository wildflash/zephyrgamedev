package com.zephyr.events
{
	import flash.events.Event;
	
	public class GameTimerEvent extends Event
	{
		
		public static const TIMER:String = "timer";
		public static const TIMER_COMPLETE:String = "timer complete";
		
		public function GameTimerEvent(type:String):void {
			super(type);
		}

	}
}