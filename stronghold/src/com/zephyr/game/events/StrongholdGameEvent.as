package com.zephyr.game.events
{
	import com.zephyr.events.GameEvent;

	public class StrongholdGameEvent extends GameEvent
	{
		
		public static const BUILD_DEFENSE:String = "build defense";
		public static const BACKGROUND_CLICKED:String = "background clicked";
		
		public function StrongholdGameEvent(type:String, params:Object=null)
		{
			super(type, params);
		}
		
	}
}