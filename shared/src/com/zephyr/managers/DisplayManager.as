package com.zephyr.managers
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;

	public class DisplayManager extends EventDispatcher
	{
		
		private static var instance:DisplayManager = new DisplayManager()
		
		public function DisplayManager():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():DisplayManager {
			return instance;
		}
		
		public var rootLayer:Object;
		
		public var bgLayer:Object;
		public var gameObjectLayer:Sprite;
		public var fxLayer:Object;
		public var statisticsLayer:Object;
		public var buttonsLayer:Object;
		
	}
}