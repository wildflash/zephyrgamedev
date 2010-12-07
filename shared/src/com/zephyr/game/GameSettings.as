package com.zephyr.game {
	
	public class GameSettings extends Object {
		
		private static var instance:GameSettings = new GameSettings();
		
		public const frameRate:Number = 60;
		
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