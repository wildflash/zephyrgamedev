package com.zephyr.game {
	
	import com.zephyr.game.levels.ILevel;
	import com.zephyr.game.levels.LevelManager;
	import flash.events.EventDispatcher;
	
	public class GameData extends EventDispatcher{
		
		private static var instance:GameData = new GameData();
		
		public static const MAX_LEVEL_NO:int = 10;
		
		private var lm:LevelManager = new LevelManager();
		public var level:ILevel;
		
		public function GameData():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():GameData {
			return instance;
		}
		
		private var _levelNo:int = 1;
		public function get levelNo():int {
			return _levelNo;
		}
		public function set levelNo(no:int):void {
			_levelNo = no;
			level = lm.setLevel(no);
		}

	}
}