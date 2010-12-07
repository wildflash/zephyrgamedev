package com.zephyr.game.objects
{
	import com.zephyr.events.GameEvent;
	import flash.display.Sprite;
	import com.zephyr.interfaces.IGameObject;

	public class SoldierPost extends Sprite implements IGameObject
	{
		
		//asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="SoldierPost")]
        private var AssetClass:Class;
		
		public function SoldierPost():void {
			this.addChild(new AssetClass());
		}
		
		public function step(event:GameEvent):void
		{
		}
		
		public function destroy():void
		{
		}
		
	}
}