package com.zephyr.game.fx
{
	import com.zephyr.game.Game;
	import com.zephyr.game.GameEvent;
	import com.zephyr.game.objects.IGameObject;
	
	import flash.display.Sprite;

	public class GameFx extends Sprite implements IGameObject, IFx
	{
		
		public var game:Game;
		public var targetDisplay:Sprite;
		
		public function GameFx(game:Game):void {
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