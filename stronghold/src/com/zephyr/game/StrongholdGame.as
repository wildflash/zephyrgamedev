package com.zephyr.game {
	import com.actionsnippet.qbox.QuickBox2D;
	import com.zephyr.events.GameObjectEvent;
	import com.zephyr.events.GameTimerEvent;
	import com.zephyr.game.events.StrongholdGameEvent;
	import com.zephyr.game.interfaces.IGunPlatform;
	import com.zephyr.game.interfaces.IPhysicsObject;
	import com.zephyr.managers.DisplayManager;
	import com.zephyr.managers.InputManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectProxy;
	
	public class StrongholdGame extends Game {
		
		private static var instance:StrongholdGame = new StrongholdGame(); 
		
		public static const PAUSE_PHYSICS:Boolean = false;
		public static const PAUSE_DAMAGE:Boolean = true;
		
		public var gameScreen:GameScreen;
		private var gameData:GameData;
		private var dm:DisplayManager = DisplayManager.getInstance();
		private var im:InputManager = InputManager.getInstance();
		
		private var phy:QuickBox2D;
		
		private var elapsedTime:Date;
		[Bindable]
		public var elapsedTimeString:String = "00:00:00";
		[Bindable]
		public var totalKills:uint = 0;
		[Bindable]
		public var unitsLoss:uint = 0;
		
		public function StrongholdGame():void {
			if(instance) {
				throw new Error("It is a Singleton and can only be accessed through Singleton.getInstance()");
			}
		}
		
		public static function getInstance():StrongholdGame {
			return instance;
		}
		
		public function init(gameScreen:GameScreen, gameData:GameData):void {
			this.gameScreen = gameScreen;
			this.gameData = gameData;
			
			initListeners();
			initPhysics(this.gameScreen.gameArea.gameMc);
			initLevel();
			play();
			
			//elapsed time
			this.elapsedTime = new Date(null,0,0,0,0,0);
			var t:GameTimer = new GameTimer(this,1000);
			t.addEventListener(GameTimerEvent.TIMER, function onTimer(event:GameTimerEvent):void {
				elapsedTime.seconds++;
				elapsedTimeString = elapsedTime.toTimeString().slice(0,8);
				//trace(elapsedTime.toTimeString());
			});
			t.start();
		}
		
		private function initListeners():void {
			im.addEventListener(GameObjectEvent.GAME_OBJECT_CLICKED, gameObjectClicked);
			im.addEventListener(StrongholdGameEvent.BACKGROUND_CLICKED, backgroundClicked);
			this.addEventListener(StrongholdGameEvent.BUILD_DEFENSE, buildDefense);
		}
		
		private function gameObjectClicked(event:GameObjectEvent):void {
			var go:Object = event.params;
			if(go is IGunPlatform) {
				if(go.installedGun==null) {
					//show available guns can be built
					//trace("gun platform clicked");
					this.gameScreen.gameBar.currentState = 'build';
					var gunArr:ArrayCollection = new ArrayCollection();
					for each(var gun1:Object in gameData.level.arsenal) {
						for each(var gun2:Object in IGunPlatform(go).compatibleGuns) {
							if(gun1==gun2) {
								var ob:Object = new ObjectProxy();
								ob.gun = gun1;
								ob.platform = go;
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
		
		private function backgroundClicked(event:StrongholdGameEvent):void {
			this.gameScreen.gameBar.currentState = '';
		}
		
		private function buildDefense(event:StrongholdGameEvent):void {
			var platform:Sprite = Sprite(event.params.platform);
			var gunClass:Class = event.params.gun;
			var gun:Sprite = new gunClass(this);
			platform.addChild(gun);
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