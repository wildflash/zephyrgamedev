package com.zephyr.abstracts
{
	import com.zephyr.game.StrongholdGame;
	import com.zephyr.game.GameEvent;
	
	import flash.display.Sprite;

	public class GameObject extends Sprite implements IGameObject
	{
		
		private var game:StrongholdGame;
		
		public function GameObject(game:StrongholdGame):void
		{
			this.game = game;
			this.game.addEventListener(GameEvent.STEP,step);
			super();
		}
		
		public function step(event:GameEvent):void {
			
		}
		
		public function destroy():void {
			
		}
		
	}
}