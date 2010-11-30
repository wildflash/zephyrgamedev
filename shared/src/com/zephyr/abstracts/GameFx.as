package com.zephyr.abstracts
{
	import com.zephyr.events.FxEvent;
	import com.zephyr.events.GameEvent;
	import com.zephyr.game.StrongholdGame;
	import com.zephyr.interfaces.IFx;
	import com.zephyr.interfaces.IGameObject;
	import com.zephyr.managers.FxManager;
	
	import flash.display.Sprite;

	public class GameFx extends Sprite implements IGameObject, IFx
	{
		
		public var game:StrongholdGame;
		public var targetDisplay:Sprite;
		
		public function GameFx(game:StrongholdGame):void {
			this.game = game;
			this.game.addEventListener(GameEvent.STEP,step);
			super();
		}
		
		public function step(event:GameEvent):void {
			//to be overriden
		}
		
		public function destroy():void {
			//to be overriden
		}
		
		public function removeFxObject():void {
			FxManager.getInstance().dispatchEvent(new FxEvent(FxEvent.REMOVE_FX_OBJECT, this));
		}
		
	}
}