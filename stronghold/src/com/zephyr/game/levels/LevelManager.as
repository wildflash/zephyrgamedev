package com.zephyr.game.levels {
	
	public class LevelManager {
		
		private var levels:Array = [];
		public var currentLevel:ILevel;
		
		public function LevelManager():void {
			//level data
			levels[1] = Level01;
		}
		
		public function setLevel(no:int):ILevel {
			currentLevel = new levels[no]();
			return currentLevel;
		}

	}
}