package com.zephyr.events
{
	import flash.events.Event;

	public class FxEvent extends Event
	{
		
		public static const PLAY_NEXT_FX:String = "play next fx";
		public static const PLAY_COMPLETED:String = "play completed";
		public static const REMOVE_FX_OBJECT:String = "remove fx object";
		
		public var params:Object;
		
		public function FxEvent(type:String, params:Object):void {
			this.params = params;
			super(type);
		}
		
	}
}