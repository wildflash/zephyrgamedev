package com.zephyr.game.levels {
	import com.zephyr.game.GameType;
	import com.zephyr.game.objects.gun.*;
	
	public class Level01 implements ILevel {
        
        //asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="Level01")]
        private var LevelClass:Class;
        
        //level properties
        public var gameType:int = GameType.DEFENSE;
        
		public function Level01():void {
			var levelSymbol:Object = new LevelClass();
			initialData = LevelTranslator.translate(levelSymbol.levelMc);
			
			arsenal = [MachineGun];
		}
		
		private var _initialData:Object;
		public function set initialData(value:Object):void {
			_initialData = value;
		}
		public function get initialData():Object {
			return _initialData;
		}
		
		private var _arsenal:Array;
		public function set arsenal(value:Array):void {
			_arsenal = value;
		}
		public function get arsenal():Array {
			return _arsenal;
		}

	}
}