package com.zephyr.game {
	import com.actionsnippet.qbox.QuickBox2D;
	import com.zephyr.events.GameObjectEvent;
	import com.zephyr.game.interfaces.IGun;
	import com.zephyr.game.interfaces.IGunPlatform;
	import com.zephyr.game.interfaces.IPhysicsObject;
	import com.zephyr.managers.DisplayManager;
	import com.zephyr.managers.InputManager;
	
	import flash.display.MovieClip;
	
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectProxy;
	
	public class StrongholdGame extends Game {
		
		public static const PAUSE_PHYSICS:Boolean = false;
		public static const PAUSE_DAMAGE:Boolean = true;
		
		public var gameScreen:GameScreen;
		private var gameData:GameData;
		private var dm:DisplayManager = DisplayManager.getInstance();
		private var im:InputManager = InputManager.getInstance();
		
		private var phy:QuickBox2D;
		
		public function StrongholdGame(gameScreen:GameScreen, gameData:GameData):void {
			this.gameScreen = gameScreen;
			this.gameData = gameData;
			
			initListeners();
			initPhysics(this.gameScreen.gameArea.gameMc);
			initLevel();
			play();
		}
		
		private function initListeners():void {
			im.addEventListener(GameObjectEvent.GAME_OBJECT_CLICKED, gameObjectClicked);
		}
		
		private function gameObjectClicked(event:GameObjectEvent):void {
			var go:Object = event.params;
			if(go is IGunPlatform) {
				if(go.installedGun==null) {
					//show available guns can be built
					//trace("gun platform clicked");
					var gunArr:ArrayCollection = new ArrayCollection();
					for each(var gun1:Object in gameData.level.arsenal) {
						for each(var gun2:Object in IGunPlatform(go).compatibleGuns) {
							if(gun1==gun2) {
								var ob:Object = new ObjectProxy();
								ob.gun = gun1;
								gunArr.addItem(ob);
							}
						}
					}
					this.gameScreen.gameBar.gunArray = gunArr;
				} else {
					//trace("gun clicked");
				}
			}
		}
		
		private function initPhysics(gameMc:MovieClip,params:Object=null):void {
			//
			this.phy = new QuickBox2D(gameMc,params);
			this.phy.addEventListener("step", dispatchStep);
			this.stepNo = 0;
		}
		
		private function initLevel():void {
			drawLevel();
			//test();
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