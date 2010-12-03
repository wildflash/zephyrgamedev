package com.zephyr.abstracts
{
	import com.zephyr.events.GameEvent;
	import com.zephyr.game.Game;
	import com.zephyr.interfaces.IGameObject;
	
	import flash.display.Sprite;

	public class GameObject extends Sprite implements IGameObject
	{
		
		private var game:Game;
		
		public function GameObject(game:Game):void
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