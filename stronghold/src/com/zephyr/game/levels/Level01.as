package com.zephyr.game.levels {
	import com.zephyr.game.GameType;
	
	
	public class Level01 implements ILevel {
        
        //asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="Level01")]
        private var LevelClass:Class;
        
        //level properties
        public var gameType:int = GameType.DEFENSE;
        
		public function Level01():void {
			var levelSymbol:Object = new LevelClass();
			
			initialData = LevelTranslator.translate(levelSymbol.levelMc);
		}
		
		private var _initialData:Object;
		public function get initialData():Object {
			return _initialData;
		}
		public function set initialData(data:Object):void {
			_initialData = data;
		}

	}
}