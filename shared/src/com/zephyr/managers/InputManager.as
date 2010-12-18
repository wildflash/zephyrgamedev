package com.zephyr.managers
{
	import flash.events.EventDispatcher;
	
	public class InputManager extends EventDispatcher
	{
		
		private static var instance:InputManager = new InputManager();
		
		public function InputManager():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():InputManager {
			return instance;
		}

	}
}