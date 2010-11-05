package com.zephyr.game.score {
	
	import flash.events.EventDispatcher;
	
	public class GameScore extends EventDispatcher {
		
		private static var instance:GameScore = new GameScore();
		
		public function GameScore():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():GameScore {
			return instance;
		}

	}
}