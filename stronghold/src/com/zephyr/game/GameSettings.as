package com.zephyr.game {
	import flash.events.EventDispatcher;
	
	public class GameSettings extends EventDispatcher {
		
		private static var instance:GameSettings = new GameSettings();
		
		public function GameSettings():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
			if(loadData()==false) {
				initData();
			}
		}
		
		public static function getInstance():GameSettings {
			return instance;
		}
		
		private function loadData():Boolean {
			
			return false;
		}
		
		private function initData():void {
			
		}

	}
}