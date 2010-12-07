package com.zephyr.events
{
	import flash.events.Event;

	public class GameObjectEvent extends Event
	{
		
		public static const REMOVE_GAME_OBJECT:String = "remove game object";
		
		public var params:Object;
		
		public function GameObjectEvent(type:String, params:Object):void {
			this.params = params;
			super(type);
		}
		
	}
}