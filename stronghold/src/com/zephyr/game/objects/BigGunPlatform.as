package com.zephyr.game.objects
{
	import flash.display.Sprite;
	
	public class BigGunPlatform extends Sprite implements IGameObject
	{
		//asset
        [Embed(source="../../../../../assets/stronghold.swf", symbol="BigGunPlatform")]
        private var LevelClass:Class;
		
		public function BigGunPlatform():void {
			this.addChild(new LevelClass());
		}

	}
}