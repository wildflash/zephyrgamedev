package com.zephyr.game {
	import com.actionsnippet.qbox.QuickBox2D;
	import com.zephyr.game.interfaces.IPhysicsObject;
	import com.zephyr.managers.DisplayManager;
	
	import flash.display.MovieClip;
	
	public class StrongholdGame extends Game {
		
		public static const PAUSE_PHYSICS:Boolean = false;
		public static const PAUSE_DAMAGE:Boolean = true;
		
		public var gameScreen:GameScreen;
		private var gameData:GameData;
		private var dm:DisplayManager = DisplayManager.getInstance();
		
		private var phy:QuickBox2D;
		
		public function StrongholdGame(gameScreen:GameScreen, gameData:GameData):void {
			this.gameScreen = gameScreen;
			this.gameData = gameData;
			
			initPhysics(this.gameScreen.gameArea.gameMc);
			initLevel();
			play();
		}
		
		private function initPhysics(gameMc:MovieClip,params:Object=null):void {
			//
			this.phy = new QuickBox2D(gameMc,params);
			this.phy.addEventListener("step", dispatchStep);
			this.stepNo = 0;
		}
		
		private function initLevel():void {
			drawLevel();
			test();
		}
		
		private function drawLevel():void {
			gameScreen.gameArea.init(gameData.level.initialData);
		}
		
		private function test():void {
			var obArr:Array = [];
			for(var i:int=0;i<dm.gameObjectLayer.numChildren;i++) {
				trace(dm.gameObjectLayer.getChildAt(i) is IPhysicsObject);
				var ob:Object = dm.gameObjectLayer.getChildAt(i);
				if(ob is IPhysicsObject) {
					//var po:IPhysicsObject = ob as IPhysicsObject;
					//ob.applyPhysics(this.phy);
					obArr.push(ob);
				}
			}
			for(i=0;i<obArr.length;i++) {
				obArr[i].applyPhysics(this.phy);
			}
			/*for each(var ob:Sprite in dm.gameObjectLayer) {
				if(ob is IPhysicsObject) IPhysicsObject(ob).applyPhysics(this.phy);
			}*/
			//dm.rootLayer.stage.stageHeight = 380;//gameScreen.gameArea.height;
			//dm.bgLayer.visible = false;
			phy.createStageWalls();
			phy.grid();
			phy.mouseDrag();
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