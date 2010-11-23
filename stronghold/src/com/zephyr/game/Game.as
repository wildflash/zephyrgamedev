package com.zephyr.game {
	import com.actionsnippet.qbox.QuickBox2D;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Game extends EventDispatcher {
		
		public static const PAUSE_PHYSICS:Boolean = false;
		public static const PAUSE_DAMAGE:Boolean = true;
		
		public var gameScreen:GameScreen;
		private var gameData:GameData;
		
		private var phy:QuickBox2D;
		private var stepNo:int;
		
		public function Game(gameScreen:GameScreen, gameData:GameData):void {
			this.gameScreen = gameScreen;
			this.gameData = gameData;
			
			initPhysics(this.gameScreen.gameArea.gameMc);
			gameScreen.gameArea.init(gameData.level.initialData);
			start();
		}
		
		private function initPhysics(gameMc:MovieClip,params:Object=null):void {
			this.phy = new QuickBox2D(gameMc,params);
			this.phy.addEventListener("step", redispatchStep);
			this.stepNo = 0;
		}
		
		private function start():void {
			this.phy.start();
		}
		
		public function pause(type:Boolean=Game.PAUSE_PHYSICS):void {
			if(type==Game.PAUSE_PHYSICS) {
				this.phy.stop();
			} else {
				
			}
		}
		
		private function redispatchStep(e:Event):void {
			this.stepNo++;
			if(this.stepNo>100) this.stepNo = 0;
			this.dispatchEvent(new GameEvent(GameEvent.STEP,this.stepNo));
		}
		
		//public static function

	}
}