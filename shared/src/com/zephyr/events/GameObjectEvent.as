package com.zephyr.events
{
	import flash.events.Event;

	public class GameObjectEvent extends Event
	{
		
		public static const REMOVE_GAME_OBJECT:String = "remove game object";
		public static const GAME_OBJECT_CLICKED:String = "game object clicked";
		
		public var params:Object;
		
		public function GameObjectEvent(type:String, params:Object):void {
			this.params = params;
			super(type);
		}
		
	}
}