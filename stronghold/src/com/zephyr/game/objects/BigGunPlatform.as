package com.zephyr.game.objects
{
	import com.zephyr.events.GameEvent;
	import com.zephyr.interfaces.IGameObject;
	
	import flash.display.Sprite;
	
	public class BigGunPlatform extends Sprite implements IGameObject
	{
		//asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="BigGunPlatform")]
        private var AssetClass:Class;
		
		public function BigGunPlatform():void {
			this.addChild(new AssetClass());
		}
		
		public function step(event:GameEvent):void {
			
		}
		
		public function destroy():void {
			
		}

	}
}