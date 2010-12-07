package com.zephyr.game {
	import com.actionsnippet.qbox.QuickBox2D;
	
	import flash.display.MovieClip;
	
	public class StrongholdGame extends Game {
		
		public static const PAUSE_PHYSICS:Boolean = false;
		public static const PAUSE_DAMAGE:Boolean = true;
		
		public var gameScreen:GameScreen;
		private var gameData:GameData;
		
		private var phy:QuickBox2D;
		
		public function StrongholdGame(gameScreen:GameScreen, gameData:GameData):void {
			this.gameScreen = gameScreen;
			this.gameData = gameData;
			
			initPhysics(this.gameScreen.gameArea.gameMc);
			gameScreen.gameArea.init(gameData.level.initialData);
			play();
		}
		
		private function initPhysics(gameMc:MovieClip,params:Object=null):void {
			this.phy = new QuickBox2D(gameMc,params);
			this.phy.addEventListener("step", dispatchStep);
			this.stepNo = 0;
		}
		
		public function play():void {
			this.phy.start();
			this.playState = Game.PLAY;
		}
		
		public function pause(type:Boolean=StrongholdGame.PAUSE_PHYSICS):void {
			if(type==StrongholdGame.PAUSE_PHYSICS) {
				this.phy.stop();
			} else {
				
			}
			this.playState = Game.PAUSED;
		}
		
		public function initGame():void {
			
		}

	}
}