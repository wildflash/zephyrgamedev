package com.zephyr.game.objects
{
	import com.zephyr.events.GameEvent;
	import flash.display.Sprite;
	import com.zephyr.interfaces.IGameObject;

	public class GunPlatform extends Sprite implements IGameObject
	{
		
		//asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="GunPlatform")]
        private var AssetClass:Class;
		
		public function GunPlatform():void {
			this.addChild(new AssetClass());
		}
		
		public function step(event:GameEvent):void {
			
		}
		
		public function destroy():void {
			
		}
		
	}
}